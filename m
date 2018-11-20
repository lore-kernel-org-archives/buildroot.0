From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 20 Nov 2018 21:36:07 +0200
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: add connmarktos
 build option
In-Reply-To: <da5a2951-731f-d529-f32d-a7437041ca30@corp.ovh.com>
References: <1542300189-12939-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
 <87o9aq5hcb.fsf@tkos.co.il>
 <25f6955b-c3f1-28a1-2a51-6ad90f391c9c@corp.ovh.com>
 <871s7jh1jd.fsf@tkos.co.il>
 <da5a2951-731f-d529-f32d-a7437041ca30@corp.ovh.com>
Message-ID: <87ftvvfsns.fsf@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi S?bastien,

DUPONCHEEL S?bastien writes:
>>>> You should also add --disable-connmarktos (or the equivalent option) in
>>>> the 'else' part of this condition.
>>> Unfortunately there is no such option.
>> The AC_ARG_ENABLE macro in configure.ac automatically provides
>> --enable-foo and --disable-foo.
>
> The AC_ARG_ENABLE statement in shadowsocks looks broken, neither --disable-connmarktos
> nor --enable-connmarktos=no are working. In fact, it activates the feature.
>
> ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)
> SHADOWSOCKS_LIBEV_DEPENDENCIES += libnetfilter_conntrack
> SHADOWSOCKS_LIBEV_CONF_OPTS += --enable-connmarktos
> else
> SHADOWSOCKS_LIBEV_CONF_OPTS += --disable-connmarktos
> endif
>
> seb at compile:src/buildroot ?shadowsocks?$ cat .config | grep CONNMARK
> # BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS is not set
> seb at compile:src/buildroot ?shadowsocks*?$ ldd ./output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/bin/ss-server | grep libnetfilter_conntrack.so.3
> 	libnetfilter_conntrack.so.3 => /home/seb/src/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib/libnetfilter_conntrack.so.3 (0x00006f816dde4000)

Did you try full rebuild? Changing the Buildroot config does not trigger
rebuild of already built packages.

  https://buildroot.org/downloads/manual/manual.html#full-rebuild

For a single package test you can use this shortcut instead of a full
rebuild:

  rm -r output/build/shadowsocks-libev-*
  make shadowsocks-libev

baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
