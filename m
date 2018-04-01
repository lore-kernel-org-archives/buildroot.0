From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 01 Apr 2018 11:45:20 +0200
Subject: [Buildroot] bash: /dev/fd/62: No such file or directory
In-Reply-To: <877ept7r7w.fsf@dell.be.48ers.dk>
References: <1521154501.16532.15.camel@embedded.rocks>
 <874llggl14.fsf@dell.be.48ers.dk>
 <d624af0cde7298851332a2fc009f173562d99d98.camel@embedded.rocks>
 <877ept7r7w.fsf@dell.be.48ers.dk>
Message-ID: <d437caa3ff89a6c3f29997a008ce74ab2f495940.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 2018-03-30 at 13:11 +0200, Peter Korsgaard wrote:
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
> Hi,
> 
>  >> Keep in mind that we still support a static /dev, so we should also add
>  >> them to system/device_table_dev.txt and redirect errors to /dev/null so
>  >> you don't get a bunch of warnings about these symlinks when booting with
>  >> a static /dev.
> 
>  > I am trying to get this working. I managed to add the entries to
>  > inittab for busybox and sysvinit
> 
> Great!
> 
>  > but I am unsure how to add those symlinks to the static
>  > /dev. makedevs does not support symbolic links.
> 
> Heh, you are right. We can either:
> 
> - Add a BASH_ROOTFS_PRE_CMD_HOOKS hook in bash.mk if static /dev is used
>   to create these symlinks
> 
> - Extend the makedevs code to also support symlinks
> 
> - Completely ignore this issue for static /dev
> 
> The first option is probably the easiest/nicest.

On second thought, bash might not be the only application using
/dev/fd. Maybe fs/common.mk is the better place?

There is one issue about /proc/kcore. It is not available on ARM
systems, and maybe others. Apparently, this feature is not much
appreciated [1], so I'm gonna skip this symlink.

[1] https://lwn.net/Articles/45315/

J?rg
