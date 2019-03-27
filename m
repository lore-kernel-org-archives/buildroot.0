From: Esben Haabendal <esben.haabendal@gmail.com>
Date: Wed, 27 Mar 2019 23:28:58 +0100
Subject: [Buildroot] [PATCH v4] mtree: new package
In-Reply-To: <20190327201803.6b1a832d@windsurf> (Thomas Petazzoni's message of
 "Wed, 27 Mar 2019 20:18:03 +0100")
References: <20190326142411.6943-1-esben.haabendal@gmail.com>
 <20190327201803.6b1a832d@windsurf>
Message-ID: <87bm1w9ck5.fsf@haabendal.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> On Tue, 26 Mar 2019 15:24:11 +0100
> Esben Haabendal <esben.haabendal@gmail.com> wrote:
>
>> diff --git a/package/mtree/Config.in b/package/mtree/Config.in
>> new file mode 100644
>> index 000000000000..175d05d3bb0d
>> --- /dev/null
>> +++ b/package/mtree/Config.in
>> @@ -0,0 +1,15 @@
>> +config BR2_PACKAGE_MTREE
>> +	bool "mtree"
>> +	# mtree uses <fts.h> which is not included by default in uClibc
>> +	depends on BR2_TOOLCHAIN_USES_GLIBC
>> +	# fts.h does not support LFS (_FILE_OFFSET_BITS==64) in glibc versions
>> +	# older than 2.23, and codesourcery-arm is currently using glibc 2.18
>> +	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
>
> My memory is a bit fuzzy on this, but we have some workarounds for this
> issue in other packages:
>
> # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
> # large file support. See https://bugzilla.redhat.com/show_bug.cgi?id=574992
> # for more information.
> LIBCGROUP_CONF_ENV = \
>         CXXFLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS" \
>         CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS"
>
>
> # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
> # large file support.
> # See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
> RESTORECOND_MAKE_OPTS += \
>         $(TARGET_CONFIGURE_OPTS) \
>         CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
>         CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS" \
>         ARCH="$(BR2_ARCH)"
>
> and in a few other places.
>
> Is it the same problem ?

Yes, sounds very much like the same problem.

> If it has been resolved in glibc 2.23, should
> we remove those work-arounds ?

It depends.  If we do that, people using external toolchains with glibc
older than 2.23 would see breakage.

> I just would like to make sure we don't work around this problem in
> different ways in different packages.

Sounds like a good plan.  Unfortunately, I don't see that any of the
proposed workaround generally good.

For packages where large file support is not deemed an important
feature, The -U_FILE_OFFSET_BITS workaround is good.  But for packages
where large file support could be relevant, it seems like a bad idea to
disable it just to stay compatible with old glibc versions that only a
few people use together with new buildroot versions.

If you like, I will switch to the -U_FILE_OFFSET_BITS for mtree
package.  I personally don't need large file support...

/Esben
