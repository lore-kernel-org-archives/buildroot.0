From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 3 Jun 2012 12:53:54 +0200
Subject: [Buildroot] [PATCH] jpeg-turbo: new package
In-Reply-To: <CA+pfegGdB802LwiCLn+frAJDyqYTpx2B59qgZLXwrJNU9vrExg@mail.gmail.com>
References: <CA+pfegELseWchx5hbbChKKi-=xtQMO9CWTyKBEV+6RpRQVEqBA@mail.gmail.com>
 <20120603092136.3a462ea1@skate>
 <CA+pfegGdB802LwiCLn+frAJDyqYTpx2B59qgZLXwrJNU9vrExg@mail.gmail.com>
Message-ID: <CAHXCMMKBJU4kO_H-WA-B2fHKZk0AK9C6EXqPtfqb5yU47i9mmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Murat, all,

2012/6/3 Murat Demirten <mdemirten@yh.com.tr>
>
> Hi,
>
> You're right, host package not important even if you're trying to build a filesystem for x86 platform because of the one-to-one compatibility of jpeg-turbo with libjpeg, I'll remove it.
>
> When I start to prepare .mk for jpeg-turbo, I see that there is a need for new dependency management option like "Provides: jpeg" in professional package management formats.

You're right about that,?I've just noticed that testing your patch.

AFAIK, there is no such infrastructure in place in BR to handle this.
Some other distro like gentoo has a virtual package mechanism.

I think such a thing can be quite easily handle in BR:

at the Config.in level:

config BR2_PACKAGE_VIRTUAL_JPEG
? ? bool "jpeg support"
if?BR2_PACKAGE_VIRTUAL_JPEG
choice
...
config BR2_PACKAGE_VIRTUAL_JPEG_LIBJPEG
? ? bool "libjpeg"
? ? select
config?BR2_PACKAGE_VIRTUAL_JPEG_JPEG_TURBO
? ? bool "jpeg-turbo"
...
endchoice
endif

if?BR2_PACKAGE_VIRTUAL_JPEG_LIBJPEG
source package/jpeg/Config.in
endif

if?BR2_PACKAGE_VIRTUAL_JPEG_JPEG_TURBO
source package/jpeg-turbo/Config.in
endif


at the *.mk level:

virtual-jpeg.mk:
# standard gentarget should do the job, no need for
source/version/site variables
VIRTUAL_JPEG_DEPENDENCY = \
? $(if $(BR2_PACKAGE_LIBJPEG),libjpeg) \
? $(if $(BR2_PACKAGE_JPEG_TURBO),jpeg-turbo)\

$(eval $(call GENTARGETS))

then all packages depending on jpeg should be ajdust to depends on virtual-jpeg.


BTW,?this has just popped up out my mind and need more careful thoughts


I don't know which solution is the best between?a virtual package
mechanism or a "PROVIDE" variable mechanism.


>
> Suppose that we built the jpeg-turbo and later we want to build tiff package. In this case, jpeg turbo will build and it replace jpeg-turbo's libjpeg.soXX files. For this reason, we have to build jpeg-turbo again to replace the libraries with correct ones.
>
> Is there any plan to address this issue in future? We just see that jpeg-turbo a lot faster than libjpeg especially on embedded environments.

Do you have any bench?
I'd like to see that ;-)

>
>
> (I will send a patch with git send-email, previous one is the result of a firewall which blocking outgoing smtp and webmail client)
>
>
Again, thx for contributing to BR,


Cheers,


--
Sam
