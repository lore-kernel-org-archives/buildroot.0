From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 20 Feb 2014 14:24:29 +0100
Subject: [Buildroot] Parallel make messes up post-build in -next
In-Reply-To: <20140220095550.GA16493@pc-eric>
References: <20140220095550.GA16493@pc-eric>
Message-ID: <CAAXf6LXRsk=roB4ogDfjcHwPZKB2YCUraR34bV3qi72ewuvK1A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 20, 2014 at 10:55 AM, Eric Le Bihan
<eric.le.bihan.dev@free.fr> wrote:
> Hi!
>
> I am currently testing the -next branch and I've encountered the following
> problem: the copy of my overlay and the execution of my post-build script is
> now performed *after* the generation of my image.
>
> Reverting commit a24877586a566e052897e50e6a0c2f53cfb029f5, which adds support
> for top-level parallel make, fixes the issue.
>
> Has anyone else experienced this problem?

I haven't tried it myself yet.
But, the rootfs and post build scripts are done from target-finalize,
and the rules to make the rootfs depend on target-finalize.
This should be fine (but probably is not and we're overlooking something).

However, aside from the above I have another doubt: I don't see any
special handling for the other special targets like
target-purgelocales, target-generatelocales, ... These targets should
be run after all generic targets, and before creating the rootfs. As
far as I can see, they could now run in parallel with the normal
targets, right?

Thanks,
Thomas
