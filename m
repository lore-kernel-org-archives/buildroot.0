From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2016 09:35:50 +0100
Subject: [Buildroot] pseudo: remaining issues...
In-Reply-To: <20161122212534.GA3529@free.fr>
References: <20161122212534.GA3529@free.fr>
Message-ID: <20161123093550.43e574f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Nov 2016 22:25:34 +0100, Yann E. MORIN wrote:

> Alternatively, we can revert back to using fakeroot for this release, at
> the expense of breaking (already previously broken) setups with SELinux
> on the host.

I am more and more thinking that this is what we should do. Not only
pseudo still has issues, but even once all issues will be fixed, it is
a much much more complicated and annoying solution than fakeroot:

 - It requires additional dependencies (host-sqlite, host-attr)

 - It requires a complicated setup, with a daemon, that you need to
   manually start and stop (because the internal pseudo mechanism to
   start/stop the daemon doesn't work properly)

So I really believe we should revert to fakeroot, and investigate what
this SELinux problem is exactly. Looking more at the original bug at
https://bugzilla.redhat.com/show_bug.cgi?id=1238802, what is the actual
problem for us? Why do we care about preserving the SELinux labels of
files within the fakeroot environment? We don't support SELinux, and
even if we did, most likely the SELinux labels that exist on the host
machine would not make sense for the target filesystem.

So is the real problem with fakeroot on Fedora related to SELinux?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
