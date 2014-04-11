From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Apr 2014 09:30:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-04-10
In-Reply-To: <87d2go5oz3.fsf@dell.be.48ers.dk>
References: <20140411063008.70B85100F1F@stock.ovh.net>
 <87d2go5oz3.fsf@dell.be.48ers.dk>
Message-ID: <20140411093044.07729d79@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 11 Apr 2014 09:01:36 +0200, Peter Korsgaard wrote:

>  >        arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/e54a3ff5542a11197f3aa6e543350f097647cb02/
>  >    powerpc |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/d67269598335db792c0134de76af2db3445cca62/
>  >        arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/678cae8ba5deadf599ae541468aedc9e52ce0942/
>  >       sh4a |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/e86b40a3f8b8c8f97923bd3f263984dfecb5a032/
>  >        arm |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/33ab1c8f1af73cb73022ae2c0652bbbc82d856c4/
>  >     x86_64 |                   avahi-0.6.31 | NOK | http://autobuild.buildroot.net/results/71698d593b63dd7817bcd6583a4f75d9adf85e2f/
> 
> It seems like something happened to the tarball. Thomas, can you take a
> look?

Weird. There are three instances of the build script on this machine,
each having its own download folder. And in one of them, the tarball
was indeed wrong:

$ find . -name 'avahi-0.6.31.tar.gz' | xargs ls -l
-rw-r--r-- 1 thomas thomas 2325974 Feb 14  2012 ./1/dl/avahi-0.6.31.tar.gz
-rw-r--r-- 1 thomas thomas 1268686 Feb 14  2012 ./2/dl/avahi-0.6.31.tar.gz
-rw-r--r-- 1 thomas thomas 1268686 Feb 14  2012 ./3/dl/avahi-0.6.31.tar.gz

The last two tarballs are OK, the first one is incorrect.

They start to differ at byte 1057289, which is just over a megabyte.

$ cmp ./1/dl/avahi-0.6.31.tar.gz ./2/dl/avahi-0.6.31.tar.gz
./1/dl/avahi-0.6.31.tar.gz ./2/dl/avahi-0.6.31.tar.gz differ: byte 1057289, line 3919

And when you look at byte 1057289 in that file, what you see is the
same contents as the beginning of the file. As if the tarball had been
truncated, and then another copy of the tarball has been appended to it.

And if you actually do:

 1057288 + 1268686 = 2325974

So the part of the tarball before they start to differ, plus the size
of the normal tarball, adds up to the size of the corrupted tarball. So
it really seems like the corrupted tarball ends up with a copy of the
correct tarball.

This looks weird, and I don't have a good explanation. For now, I've
removed this bogus file, and we'll see if this occurs again in the
future.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
