From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Nov 2016 00:25:50 +0100
Subject: [Buildroot] pseudo: remaining issues...
In-Reply-To: <20161123093550.43e574f3@free-electrons.com>
References: <20161122212534.GA3529@free.fr>
 <20161123093550.43e574f3@free-electrons.com>
Message-ID: <CACXmViZGA7ZOOWBm8wRdeBNCe76h2Bo9kjJX6rvaUkmRc=98eg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 23, 2016 at 9:35 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> I am more and more thinking that this is what we should do. Not only
> pseudo still has issues, but even once all issues will be fixed, it is
> a much much more complicated and annoying solution than fakeroot:
>
>  - It requires additional dependencies (host-sqlite, host-attr)
>
>  - It requires a complicated setup, with a daemon, that you need to
>    manually start and stop (because the internal pseudo mechanism to
>    start/stop the daemon doesn't work properly)
>
> So I really believe we should revert to fakeroot, and investigate what
> this SELinux problem is exactly.

I agree. Lets play it safe and stick to fakeroot for now. I'm not sure
what pseudo really buys us for all this extra complexity (besides the
selinux issue, but see below).


> Looking more at the original bug at
> https://bugzilla.redhat.com/show_bug.cgi?id=1238802, what is the actual
> problem for us? Why do we care about preserving the SELinux labels of
> files within the fakeroot environment? We don't support SELinux, and
> even if we did, most likely the SELinux labels that exist on the host
> machine would not make sense for the target filesystem.
>
> So is the real problem with fakeroot on Fedora related to SELinux?

I've set up a Fedora VM and looked closer at the issue. The problem
isn't directly related to fakeroot. Instead it is (arguably) a bug in
'sed -i'. Fedora uses SELinux and sed on Fedora is built with SELinux
support. When sed detects that SELinux is enabled, then it tries to
copy the SELinux xattrs from whe source file to the new temporary file
it creates when the -i option is used. As fakeroot isn't built with
xattr support this fails, and we end up with output/build/ubinize.cfg
with zero permissions, causing ubinize to fail when it cannot read it.

A workaround is to simply not use sed -i inside ROOTFS_UBI_CMD, E.G.
replace the install + sed -i with a single sed >
output/build/ubinize.cfg.

I will send a patch to do that, so we can keep #9386 fixed after
reverting to fakeroot.

-- 
Bye, Peter Korsgaard
