From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 09 Jan 2013 17:21:55 +0200
Subject: [Buildroot] new <pkg>_CONFIG_FIXUP variable
In-Reply-To: <20130109085412.3ec3662c@skate>
References: <1357596078-7762-1-git-send-email-stefan.froberg@petroprogram.com>
 <201301072310.10765.yann.morin.1998@free.fr>
 <50EB4BC6.6020807@petroprogram.com>
 <201301090021.28343.yann.morin.1998@free.fr> <20130109085412.3ec3662c@skate>
Message-ID: <50ED8B13.7040701@petroprogram.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Hi Thomas

I tried that empty variable checking example you gave but it won't work.
If I remove DIVINE_CONFIG_FIXUP from divine.mk it will still spit the
"Fixing package configuration files" message

This is what it looks so far. Added your variable checking and removed
redundant '\ from sed line as Arnout said.

    if test -n $($(PKG)_CONFIG_FIXUP) ; then \
        $(call MESSAGE,"Fixing package configuration files") ;\
        for file in $($(PKG)_CONFIG_FIXUP); do \
            if [ -e $(STAGING_DIR)/usr/bin/$${file} ]; then \
                $(SED) "s,^prefix=.*,prefix=$(STAGING_DIR)/usr,g" \
                    -e
"s,^exec_prefix=.*,exec_prefix=$(STAGING_DIR)/usr,g" \
                    $(STAGING_DIR)/usr/bin/$${file} ;\
            fi \
        done \
    fi
    $(Q)touch $@

And this is what happens:

test -z "/usr/bin" || /bin/mkdir -p
"/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/bin"
test -z "/usr/lib/pkgconfig" || /bin/mkdir -p
"/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/pkgconfig"
 /usr/bin/install -c 'divine-config'
'/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/bin/divine-config'
 /usr/bin/install -c -m 644 'divine.pc'
'/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib/pkgconfig/divine.pc'
make[3]: Poistutaan hakemistosta
"/mnt/hee/new/buildroot-2012.08/output/build/divine-0.4.0"
make[2]: Poistutaan hakemistosta
"/mnt/hee/new/buildroot-2012.08/output/build/divine-0.4.0"
make[1]: Poistutaan hakemistosta
"/mnt/hee/new/buildroot-2012.08/output/build/divine-0.4.0"
for i in $(find
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/lib*
-name "*.la"); do cp -f $i $i~; /bin/sed -i -e "s:\(['=
]\)/usr:\\1/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr:g"
$i; done
if test -n  ; then \
    echo "[7m>>> divine 0.4.0 "Fixing package configuration files"[27m" ;\
    for file in ; do \
        if [ -e
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/bin/${file}
]; then \
            /bin/sed -i -e
"s,^prefix=.*,prefix=/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr,g"
\
                -e
"s,^exec_prefix=.*,exec_prefix=/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr,g"
\
               
/mnt/hee/new/buildroot-2012.08/output/host/usr/i586-unknown-linux-uclibc/sysroot/usr/bin/${file}
;\
        fi \
    done \
fi
[7m>>> divine 0.4.0 Fixing package configuration files[27m
[7m>>> divine 0.4.0 Installing to target[27m
PATH="/mnt/hee/new/buildroot-2012.08/output/host/bin:/mnt/hee/new/buildroot-2012.08/output/host/usr/bin:/mnt/hee/new/buildroot-2012.08/output/host/usr/sbin/:/root/perl5/bin:/root/perl5/bin:/root/perl5/bin:/usr/lib/ccache:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin"
PERLLIB="/mnt/hee/new/buildroot-2012.08/output/host/usr/lib/perl" 
/usr/bin/make -j4 DESTDIR=/mnt/hee/new/buildroot-2012.08/output/target 
install -C /mnt/hee/new/buildroot-2012.08/output/build/divine-0.4.0/
make[1]: Siirryt??n hakemistoon
"/mnt/hee/new/buildroot-2012.08/output/build/divine-0.4.0"
Making install in include
make[2]: Siirryt??n hakemistoon
"/mnt/hee/new/buildroot-2012.08/output/build/divine-0.4.0/include"
make[3]: Siirryt??n hakemistoon
"/mnt/hee/new/buildroot-2012.08/output/build/divine-0.4.0/include"


9.1.2013 9:54, Thomas Petazzoni kirjoitti:
> Dear Yann E. MORIN,
>
> On Wed, 9 Jan 2013 00:21:28 +0100, Yann E. MORIN wrote:
>
>> All in all, in my experience, that's roughly split in those four fourths.
>> Comunity work like here, and professional work alike.
> Agreed. In this specific case, I'd say about 5 lines of documentation
> are probably needed. I'm willing to provide the patch if needed.
>
> Thomas

That would be great!

Regards
Stefan
