From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 17 Aug 2012 14:29:53 +0200
Subject: [Buildroot] [PATCH 05/36] package/libiscsi: new package
In-Reply-To: <20120817131432.205de8e1@skate>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-5-git-send-email-yann.morin.1998@free.fr>
 <20120817131432.205de8e1@skate>
Message-ID: <CAHXCMMK1cMmkCbOFU5=ZsCADzGrK-e0i7RYGu+XSFyYh9hU3Tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/8/17 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Mon, 13 Aug 2012 01:53:53 +0200,
> "Yann E. MORIN" <yann.morin.1998@free.fr> a ?crit :
>
>> +LIBISCSI_VERSION         = 1.5.0
>> +LIBISCSI_SITE            = git://github.com/sahlberg/libiscsi.git
>
> You can instead use
>
> https://github.com/sahlberg/libiscsi/zipball/$(LIBISCI_VERSION)
>
> which will download a zip file of the project.

I think the right url is:
https://github.com/downloads/sahlberg/libiscsi/libiscsi-1.5.0.tar.gz

Though the zipball/tarball url is valid as soon as a tag is pushed in
the repository, it will require some more plumbing in the download
infrastructure since the downloaded file name is $(FOO_VERSION) with
no extension. What a pity!

BTW, to get a source archive available on
https://github.com/downloads/*, the maintainers of the projects have
to upload it.

>
>> +LIBISCSI_LICENSE         = LGPLv2.1+
>> +LIBISCSI_LICENSE_FILES   = COPYING LICENCE-LGPL-2.1.txt
>> +# Note: the binaries are GPLv2+, but we do not use them
>> +LIBISCSI_INSTALL_STAGING = YES
>> +LIBISCSI_DEPENDENCIES    = popt
>> +
>> +#----------------------------------------------------------------------------
>> +# Package build process
>> +
>> +# As we use the git repository, we need to generate the configure script
>> +# Using the standard autoreconf does not work (missing m4/ dir)
>> +define LIBISCSI_CREATE_CONFIGURE
>> +     cd $(@D); ./autogen.sh
>> +endef
>> +LIBISCSI_PRE_CONFIGURE_HOOKS += LIBISCSI_CREATE_CONFIGURE
>> +LIBISCSI_DEPENDENCIES        += host-autoconf
>
> host-autoconf will not bring host-automake, so I think you should
> either depend on host-automake (which itself depends on host-autoconf),
> or you should do like the autotools package infrastructure does:
> FOO_DEPENDENCIES += host-automake host-autoconf host-libtool.

I would assume that the autotools-package infrastructure automatically
pulled these host dependencies...



-- 
Sam
