From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:14:59 +0200
Subject: [Buildroot] [PATCH] system/skeleton: make /var/run a symlink to
 /run
In-Reply-To: <20200629104749.46938-1-nolange79@gmail.com>
References: <20200629104749.46938-1-nolange79@gmail.com>
Message-ID: <20200714151459.6ee4ca7a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Norbert,

On Mon, 29 Jun 2020 12:47:49 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> both systemd and FHS3 denote /var/run as a compatibility directory,
> new systems should use /run.
> 
> There seems to be little reason to not switch to the new FHS layout
> with buildroot, and adding the compatibility symlink.
> 
> [1] - https://refspecs.linuxfoundation.org/FHS_3.0/fhs/ch05s13.html

The commit log is a bit confusing here, especially when looking at the
patch. Indeed, we see you are *removing* code that creates /var/run as
a symlink to /run, but you're saying that you're making /var/run a
symlink to /run.

However, what really happens is that /var/run was already a symlink to
/run when the selected init system is systemd, but not with other init
systems. What your patch does is that it moves all init system to this
convention.

So perhaps a better commit title would be:

===

system/skeleton: always make /var/run a symlink to /run

While Buildroot was already making /var/run a symlink to /run when
systemd was selected as the init system, it was not the case with other
init systems.

However, FHS3 denotes /var/run as a compatibility directory, and new
systems should use /run. So let's switch to this convention regardless
of the init system being used.

===

Also, was there any specific motivation/issue for this change, or just
make things "nicer" ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
