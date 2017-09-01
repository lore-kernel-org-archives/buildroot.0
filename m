From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 1 Sep 2017 21:36:27 +0200
Subject: [Buildroot] [PATCH] package/xmlstarlet: fix host build
In-Reply-To: <20170831213337.707c6ca9@windsurf.lan>
References: <20170830224010.15658-1-romain.naour@gmail.com>
 <20170831091419.3d0039cc@windsurf.lan>
 <CANLo3Jix+ojJWq6QTRaxxpOMDHBJtkUkiZnAzy6neY95h=OGCA@mail.gmail.com>
 <20170831093921.11448124@windsurf.lan>
 <CANLo3Jj1_a7+n1on26o94mzxRVKhZFGH4+g981GxyqmUng-2Gg@mail.gmail.com>
 <20170831131049.5541217e@windsurf.lan>
 <7d358a39-0c49-204c-f784-d0e7efc646bd@gmail.com>
 <20170831213337.707c6ca9@windsurf.lan>
Message-ID: <bcce37b5-860e-9bee-12c3-29634376caa4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 31/08/2017 ? 21:33, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Thu, 31 Aug 2017 20:42:10 +0200, Romain Naour wrote:
> 
>> checking for xml2-config... /bin/xml2-config
>> configure: using libxml-2.9.4
>> checking for xslt-config...
>> /home/naourr/buildroot-test/test/arete-glibc2.26/host/bin/xslt-config
>> configure: using libxslt-1.1.29
> 
> Is HOST_DIR/bin in the PATH when calling configure? Why does it
> use /bin/xml2-config and not the one in HOST_DIR/bin ?

HOST_DIR/bin is in the first place in the PATH used when calling configure

PATH="[...]/host/bin:...

And the content is:

ls -1 [...]/host/bin/
[...]
xml
xml2-config
xmlcatalog
xmllint
xslt-config
xsltproc

So all is ok
Let's take a look at the configure.ac:

XSTAR_LIB_CHECK([LIBXML], [xml2-config])

XSTAR_LIB_CHECK come from a local m4 file m4/xstar-check-libs.m4 where it use

AC_PATH_PROG(LIBXXX()_CONFIG, xxx_config(),
               [], [$LIBXXX()_PREFIX/bin$PATH_SEPARATOR$PATH]

Since no prefix seems to be defined, AC_PATH_PROG look by itself at /bin/ for
xml2-config... (bad)

Either we have to define a prefix like this patch is doing or override
ac_cv_path_LIBXML_CONFIG

HOST_XMLSTARLET_CONF_ENV += \
	ac_cv_path_LIBXML_CONFIG=$(HOST_DIR)/bin/xml2-config \
	ac_cv_path_LIBXSLT_CONFIG=$(HOST_DIR)/bin/xslt-config

For some reason, I have this issue only on my machine at home...
(Fedora 25) but not at work (debian 8).

On my machine
ls -l /
bin -> usr/bin

Maybe on debian /bin and /usr/bin is not the same directory...
That's why this issue is not triged by autobuilders.

XSTAR_LIB_CHECK behavior looks dubious... why no prefix is set by default ??

Best regards,
Romain

> 
> Thomas
> 
