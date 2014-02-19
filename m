From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Feb 2014 17:02:18 +0100
Subject: [Buildroot] Open bug analysis
In-Reply-To: <53024B08.1040709@mind.be>
References: <CAAXf6LUmkkW8RxfC8RjYTYRnFDJ+TbNOiKM+LyMBDHJu37ORZA@mail.gmail.com>
 <20140213195254.0b17b5bf@skate>
 <CAAXf6LVJwg4Xcjg1rMZvfgC8xi-9TJrV7faUknff630duLG_AQ@mail.gmail.com>
 <53024B08.1040709@mind.be>
Message-ID: <CAAXf6LWOJo8FPMgX=Hmk=u2QtJW6VS8JODnxK2HPfvLDuEWkgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Feb 17, 2014 at 6:46 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
[..]
>> As mentioned on IRC, I'm currently using a slightly modified version
>> of the above .la fixing:
>>
>> -               $$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
>> +               $$(SED) "s:\(['=
>> ]\)/usr/lib:\\1$(STAGING_DIR)/usr/lib:g" $$$$i; \
>> +               $$(SED) "s:\(['=
>> ]\)/usr/local/lib:\\1$(STAGING_DIR)/usr/local/lib:g" $$$$i; \
>>
>> I.e. instead of searching for /usr/something, only search for /usr/lib
>> as this is where all .la files are put.
>> I actually don't think we need the /usr/local/lib line.
>
>  Just brainstorming here, but I think a more complete solution could be
> something like:
>
> $$(SED) -e "s:\(['= ]\)$(STAGING_DIR):\\1 at STAGING_DIR@:g" \
>         -e "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" \
>         -e "s:@STAGING_DIR@:$(STAGING_DIR):g" \
>         $$$$i;
>

I have yet to try this alternate proposal, but in the meantime I have
done several randpackage tests with the mentioned code, and this works
without problem apparently. I have changes in pkg-autotools.mk (fixup
of .la files), pkg-generic (fixup of .pc files), and qt5.

There is one wrong path that remains (but seems to cause no problem),
but this same problem is present in 'normal' buildroot builds outside
of /usr: several .la files contain strings of the form:
-L /path/to/buildroot/sysroot/path/to/buildroot/sysroot/usr/lib

I tracked down this issue: when asking pkgconf for the libs
corresponding to a certain dependency expression, it will add the
sysroot to those strings it thinks need it. This works fine when the
paths are /usr /usr/lib etc, but not in case the library dependency is
already a full path. For example, when gcrypt and gnutls are enabled,
libecore is compiled with: --with-libgcrypt-prefix=$(STAGING_DIR)/usr,
causing an absolute path to be present. This is later prefixed by
pkgconf with another instance of STAGING_DIR.

We could fix that by doing a SED on <staging>/<staging> too, and
replace it with just one <staging>. This would seem 'hacky' but
actually would fix incorrect paths.

Best regards,
Thomas
