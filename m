From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 31 Aug 2017 20:42:10 +0200
Subject: [Buildroot] [PATCH] package/xmlstarlet: fix host build
In-Reply-To: <20170831131049.5541217e@windsurf.lan>
References: <20170830224010.15658-1-romain.naour@gmail.com>
 <20170831091419.3d0039cc@windsurf.lan>
 <CANLo3Jix+ojJWq6QTRaxxpOMDHBJtkUkiZnAzy6neY95h=OGCA@mail.gmail.com>
 <20170831093921.11448124@windsurf.lan>
 <CANLo3Jj1_a7+n1on26o94mzxRVKhZFGH4+g981GxyqmUng-2Gg@mail.gmail.com>
 <20170831131049.5541217e@windsurf.lan>
Message-ID: <7d358a39-0c49-204c-f784-d0e7efc646bd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 31/08/2017 ? 13:10, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Thu, 31 Aug 2017 12:51:24 +0200, Romain Naour wrote:
> 
>> Well, gmail app on my phone...
> 
> Gaah, horrible (again with this e-mail).

The phone is now in RO mode :)

> 
>> Libxml-dev wasn't installed on my host.
>> I'll take a look later today.
>>
>> Btw, host-xmlstarlet is a dependendy of kodi package which depends on java
>> installed on the host.
>>
>> Maybe host-xmlstarlet is never build on the autobuiders ?
>>
>> Can you try to build it ?
> 
> It builds fine on my autobuilder:
> 
>>>> host-xmlstarlet 1.6.1 Building
> PATH="/home/test/foo/host/bin:/home/test/foo/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" PKG_CONFIG="/home/test/foo/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/test/foo/host/lib/pkgconfig:/home/test/foo/host/share/pkgconfig"  /usr/bin/make -j9  -C /home/test/foo/build/host-xmlstarlet-1.6.1/
> /usr/bin/make  all-am
>   GEN      src/usage.c
>   GEN      src/c14n-usage.c
>   GEN      src/depyx-usage.c
>   GEN      src/edit-usage.c
>   GEN      src/elem-usage.c
>   GEN      src/escape-usage.c
>   GEN      src/format-usage.c
>   GEN      src/ls-usage.c
>   GEN      src/pyx-usage.c
>   GEN      src/select-usage.c
>   GEN      src/trans-usage.c
>   GEN      src/unescape-usage.c
>   GEN      src/validate-usage.c
>   CC       src/trans.o
>   CC       src/xml.o
>   CC       src/xml_C14N.o
>   CC       src/xml_depyx.o
>   CC       src/xml_edit.o
>   CC       src/xml_elem.o
>   CC       src/xml_escape.o
>   CC       src/xml_format.o
>   CC       src/xml_ls.o
> src/xml_edit.c: In function 'edInsert':
> src/xml_edit.c:371:27: warning: 'node' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   CC       src/xml_pyx.o
>   CC       src/xml_select.o
>   CC       src/xml_trans.o
>   CC       src/xml_validate.o
>   CC       src/usage.o
>   CC       src/c14n-usage.o
>   CC       src/depyx-usage.o
>   CC       src/edit-usage.o
>   CC       src/elem-usage.o
> src/xml_select.c: In function 'selPrepareXslt':
> src/xml_select.c:552:17: warning: pointer targets in passing argument 3 of 'xmlStrPrintf' differ in signedness [-Wpointer-sign]
> In file included from /home/test/foo/host/include/libxml2/libxml/tree.h:18:0,
>                  from src/xml_select.c:38:
> /home/test/foo/host/include/libxml2/libxml/xmlstring.h:98:17: note: expected 'const char *' but argument is of type 'xmlChar *'
>   CC       src/escape-usage.o
>   CC       src/format-usage.o
>   CC       src/ls-usage.o
>   CC       src/pyx-usage.o
>   CC       src/select-usage.o
>   CC       src/trans-usage.o
>   CC       src/unescape-usage.o
>   CC       src/validate-usage.o
>   CCLD     xml
>>>> host-xmlstarlet 1.6.1 Installing to host directory
> PATH="/home/test/foo/host/bin:/home/test/foo/host/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" PKG_CONFIG="/home/test/foo/host/bin/pkg-config" PKG_CONFIG_SYSROOT_DIR="/" PKG_CONFIG_ALLOW_SYSTEM_CFLAGS=1 PKG_CONFIG_ALLOW_SYSTEM_LIBS=1 PKG_CONFIG_LIBDIR="/home/test/foo/host/lib/pkgconfig:/home/test/foo/host/share/pkgconfig"  /usr/bin/make -j9 install -C /home/test/foo/build/host-xmlstarlet-1.6.1/
>  /bin/mkdir -p '/home/test/foo/host/share/doc/xmlstarlet'
>  /bin/mkdir -p '/home/test/foo/host/share/man/man1'
>  /usr/bin/install -c -m 644 doc/xmlstarlet-ug.html doc/html.css doc/xmlstarlet.txt '/home/test/foo/host/share/doc/xmlstarlet'
>  /usr/bin/install -c -m 644 doc/xmlstarlet.1 '/home/test/foo/host/share/man/man1'
>  /bin/mkdir -p '/home/test/foo/host/bin'
>   /usr/bin/install -c xml '/home/test/foo/host/bin'
> 
> It detects libxml and libxslt in $(HOST_DIR), according to the
> configure script:
> 
> checking for xml2-config... /home/test/foo/host/bin/xml2-config
> configure: using libxml-2.9.4
> checking for xslt-config... /home/test/foo/host/bin/xslt-config
> configure: using libxslt-1.1.29

I haven't the same result here:

checking for xml2-config... /bin/xml2-config
configure: using libxml-2.9.4
checking for xslt-config...
/home/naourr/buildroot-test/test/arete-glibc2.26/host/bin/xslt-config
configure: using libxslt-1.1.29

That trigger the issue (see -I//include/libxml2):

/usr/bin/gcc -DHAVE_CONFIG_H -I.  -I[...]/host/include -I//include/libxml2
-I[...]/host/include -Wall -pedantic -ansi -O2 -I[...]/host/include -c -o
src/trans.o src/trans.c
[...]
src/xml_C14N.c:12:31: fatal error: libxml/xmlversion.h: No such file or directory
 #include <libxml/xmlversion.h>
                               ^
In file included from src/trans.c:4:0:
src/trans.h:32:30: fatal error: libxml/xmlmemory.h: No such file or directory
 #include <libxml/xmlmemory.h>
                              ^

> 
> Indeed $(HOST_DIR)/bin is before /usr/bin in the PATH so it uses the
> Buildroot-built libraries.
> 
> Could you investigate a little bit more what's going on in your case? I
> believe your patch is OK, but I'd feel more comfortable with a more
> solid explanation.

Ok I'll respin...

What's about this instead ?

HOST_XMLSTARLET_CONF_ENV += \
	ac_cv_path_LIBXML_CONFIG=$(HOST_DIR)/bin/xml2-config \
	ac_cv_path_LIBXSLT_CONFIG=$(HOST_DIR)/bin/xslt-config

Best regards,
Romain
> 
> Best regards,
> 
> Thomas
> 
