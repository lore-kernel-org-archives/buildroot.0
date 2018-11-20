From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Nov 2018 23:25:01 +0100
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: add connmarktos
 build option
In-Reply-To: <da5a2951-731f-d529-f32d-a7437041ca30@corp.ovh.com>
References: <1542300189-12939-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
 <87o9aq5hcb.fsf@tkos.co.il>
 <25f6955b-c3f1-28a1-2a51-6ad90f391c9c@corp.ovh.com>
 <871s7jh1jd.fsf@tkos.co.il>
 <da5a2951-731f-d529-f32d-a7437041ca30@corp.ovh.com>
Message-ID: <cb8d9edb-ac71-c5b6-15dc-8c89ea712c6c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/11/2018 14:56, DUPONCHEEL S?bastien wrote:
> Hi Baruch,
> 
> Please see my feedback below :
> 
> Le 17/11/2018 ? 21:49, Baruch Siach a ?crit?:
[snip]
>> The AC_ARG_ENABLE macro in configure.ac automatically provides
>> --enable-foo and --disable-foo.
> 
> The AC_ARG_ENABLE statement in shadowsocks looks broken, neither --disable-connmarktos 
> nor --enable-connmarktos=no are working. In fact, it activates the feature.

 Yes, that's a classic problem - people refuse to read documentation so they
don't notice that the third argument is not "code to run when the option is yes"
but actually it is "code to run when the option is given".

 So, either you fix this by patching shadowsocks-libev's configure.ac and replacing

-  enable_connmarktos="yes"
+  enable_connmarktos="$enableval"

and sending the patch upstream, or you do

ifeq ($(BR2_PACKAGE_SHADOWSOCKS_LIBEV_CONNMARKTOS),y)
SHADOWSOCKS_LIBEV_DEPENDENCIES += libnetfilter_conntrack
SHADOWSOCKS_LIBEV_CONF_OPTS += --enable-connmarktos
# --disable-connmarktos *enables* it.
endif

 Obviously, the first option is preferred.

 Regards,
 Arnout

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
> 
> Best regards,
> DUPONCHEEL S?bastien.
> 
>> baruch
>>
>> --
>>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
>> =}------------------------------------------------ooO--U--Ooo------------{=
>>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
