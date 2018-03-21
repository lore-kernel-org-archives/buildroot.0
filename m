From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 21 Mar 2018 16:25:03 +0100
Subject: [Buildroot] bash: /dev/fd/62: No such file or directory
In-Reply-To: <874llggl14.fsf@dell.be.48ers.dk>
References: <1521154501.16532.15.camel@embedded.rocks>
 <874llggl14.fsf@dell.be.48ers.dk>
Message-ID: <1521645903.17352.2.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Fri, 2018-03-16 at 15:19 +0100, Peter Korsgaard wrote:
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
>  > Hi,
>  > I am facing an issue with busybox init system, bash and mdev. When
> a
>  > bash script uses process substitution, bash ends with an error:
> 
>  >    """
>  >    # bash -c 'read x< <(echo 1); echo $x'
>  >    bash: /dev/fd/62: No such file or directory
>  >    """
> 
>  > The issue is addressed is some threads, e.g. [1]. The problem is
> that
>  > /dev/fd does not exist when using mdev:
> 
> So that is really strictly seen a bug in bash. The /dev/fd
> convenience
> symlink is afaik a convention from udev/systemd.
> 
> But OK, bash might not be alone and the pragmatic solution would
> indeed
> be to create these symlinks ourselves in the busybox and sysvinit
> inittabs, similar to how we create /dev/pts and /dev/shm.
> 
> It is only really needed if (e)udev isn't used, but it doesn't really
> hurt to create them even if eudev will recreate them afterwards.
> 
> Keep in mind that we still support a static /dev, so we should also
> add
> them to system/device_table_dev.txt and redirect errors to /dev/null
> so
> you don't get a bunch of warnings about these symlinks when booting
> with
> a static /dev.
> 
> Notice that it isn't only about /dev/fd. From
> eudev-3.2.5/src/shared/dev-setup.c:
> 
>         static const char symlinks[] =
>                 "-/proc/kcore\0"     "/dev/core\0"
>                 "/proc/self/fd\0"    "/dev/fd\0"
>                 "/proc/self/fd/0\0"  "/dev/stdin\0"
>                 "/proc/self/fd/1\0"  "/dev/stdout\0"
>                 "/proc/self/fd/2\0"  "/dev/stderr\0";
> 
> There is some logic to only create /dev/core if /proc/kcore exists,
> but
> I think we can just create it unconditionally.

Thanks for looking into this!

> Care to send patches doing this?

Yes, I can do that.

J?rg
