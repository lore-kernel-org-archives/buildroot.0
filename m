From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Fri, 21 Aug 2015 15:39:05 +0200
Subject: [Buildroot] [PATCH 3/7 v2] galera: new package
In-Reply-To: <CAHXCMML5sejdn7saGW8znTAGdDzAUcE-Y4TVQT0ttSJDt4whqg@mail.gmail.com>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-4-git-send-email-sylvain.raybaud@green-communications.fr>
 <CAHXCMML5sejdn7saGW8znTAGdDzAUcE-Y4TVQT0ttSJDt4whqg@mail.gmail.com>
Message-ID: <55D729F9.3090705@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Samuel

Again, thanks for this review. Inlined, my comments about some points:

On 09/07/2015 23:29, Samuel Martin wrote:
>> + + # these will be used only with our softaware + if
>> strict_build_flags == 1: +-    conf.env.Append(CPPFLAGS = '
>> -Werror') ++    conf.env.Append(CPPFLAGS = ' -Werror
>> -Wno-error=uninitialized -Wno-error=pedantic')
> Hum... -Werror is more a development flag than an integration one.
> It should certainly be removed.

Yep, as Arnout suggested I made sure strict_build_flags wasn't set.
Thanks for pointing this out.


>> +GALERA_SCONS_ENV = $(TARGET_CONFIGURE_OPTS)
>> BR2_ARCH=$(BR2_ARCH) +ifeq ($(BR2_x86_64),y) +GALERA_SCONS_ENV +=
>> BR2_x86=64
> BR2_ prefix is usually reserved for buildroot scope. Maybe this 
> variable could be rename GALERA_BITWISE instead of BR2_x86?

Done.

> 
>> +else ifeq ($(BR2_i386),y) +GALERA_SCONS_ENV += BR2_x86=32 +else 
>> +GALERA_SCONS_ENV += BR2_x86=0
> Hum... looks dubious! Does this mean that galera is only available
> for x86 and x86_64 target? Other architectures can also be
> available in 32bits and 64bits (arm/aarch64, mips/mips64, etc). 
> Last thing, the variable BR2_ARCH_IS_64 is set when the bitwise is 
> 64bit, whatever the CPU architecture, so prefer using it.

You're right, the logic was poor. I'm not aware of such restriction. I
rewrote it using BR2_ARCH_IS_64, thus eliminating the cases in which
BR2_x86 was not set.

>> + +define GALERA_BUILD_CMDS +        cd $(@D) && \ +
>> $(GALERA_SCONS_ENV) \ +         CROSS=$(TARGET_CROSS) \
> CROSS=... can be appended to the GALERA_SCONS_ENV variable.

If I understand Arnout's remark correctly, it shouldn't even be needed
because all the necessary information is already present in
TARGET_CONFIGURE_OPTS which should be passed in the environment of
scons. However, I think it was already the case (see the definition
and use of GALERA_SCONS_ENV in my original patch). I'll test again and
let you know.

>> +$(eval $(generic-package)) +$(eval $(host-generic-package))
> Why a host-galera package? Note that, as is, this host-galera
> package will build/install nothing because of the generic infra
> used without any HOST_GALERA_*_CMDS definition.

Right. I added this line for the sake of completeness without
realising it wasn't doing anything. I don't need it, so I removed it.

Cheers,

Sylvain

> 
> Regards,
> 
> 

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV1yn5AAoJEEkkwl4JtJ9yA5UP/AoNuPuDByEKQ7SQ6TW5iujc
/980AigEbYtidC+HKc/eL7lWXEjD3L9gfi3G5jaVOEwDql4GftFmW6U7aoi/2bdf
GokEeY13EwFq2bK6kzEV2EX7m/R7rQVeFaWqZPqw+HxAYJ9mt/fyQYci0eTg1uEN
WpPV6Mci/wFQZUrTlnD/g6wmNbHu/d1/4uNJ+PJQ/lCM4owsgcAuNpamgxAJsQRh
zIsgqpAh3ZN2VteSf8v9bigLR9cUOdmcuQC+6C8FKUzlnHzJZO/KWOrIPk3DmF2N
erPG2zrjp77BtXK9Q38Tlxomwl2Udh7iNhMuiOlrCgcQCekFvRQmejjk8hD5fFec
HiS3eFDDVidsMvGMnu3lQ65H+gy4btFSgpxSD1iSlTD96/DNPR3IRBWBfnwP1D5U
3Hd8Q57/WTalm/0FoHvuAkDDmnOpWRcEtQRt4WNJoyEUfq5g8W7bhuIN75+ZO/Pv
VfpdJZDpalZj2l5Xv2S3onFEvaLUsm9J9jy40shtE9x3gk3OTzuHzxgZKzSlHAUv
xt9m734fhw6PrP4b63pGZvTP6E+RKP8a2V/v+9/3XjS8ZYGfIfr300XfS892naWE
XFbXNDT9T2sMJc/MSo670Xd7QH/s8n9r5COsfgSe3lJ5aDGpss8vgjPUC6GqohA+
M4towyyAL7e0qh1G0V5W
=ogdi
-----END PGP SIGNATURE-----
