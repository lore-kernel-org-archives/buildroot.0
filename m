From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Fri, 15 Jan 2016 06:13:01 +0100
Subject: [Buildroot] [PATCH 1/1] configs: beaglebone: update kernel to
 4.1.13 and u-boot to 2015.10
In-Reply-To: <56981620.5020805@mind.be>
References: <1452653542-5562-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20160113095153.6b4f95cb@free-electrons.com> <56981620.5020805@mind.be>
Message-ID: <56987FDD.5060508@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dear Arnout, Thomas & All,


On 01/14/2016 10:41 PM, Arnout Vandecappelle wrote:
> On 13-01-16 09:51, Thomas Petazzoni wrote:
>> Zoltan,
>> 
>> On Wed, 13 Jan 2016 03:52:22 +0100, Zoltan Gyarmati wrote:
>> 
> [snip]
>>> ...comment-block-of-fdt_get_property_namelen.patch |   32 + 
>>> .../0002-fdt-Add-a-function-to-count-strings.patch |  246 +++ 
>>> ...d-a-function-to-get-the-index-of-a-string.patch |  159 ++ 
>>> ...004-fdt-Add-functions-to-retrieve-strings.patch |  173 ++
>> 
>> I am not supper happy with the solution of having those DTC
>> patches specifically for the BeagleBone platform. If I understand
>> correctly, those patches are needed to get the DT overlay to
>> work, right ?
> 
> I was the one suggesting that approach...

Yes, i added them by following Arnout's advice.

> 
> 
>> We had the same problem for the C.H.I.P platform, so it would
>> also be useful for us to have a overlay-capable DTC. You can see
>> what my colleague Antoine T?nart did:
>> 
>> https://github.com/NextThingCo/CHIP-buildroot/commit/1a73b514d204d0c6
e9100d53011a11d99fd8b778
>>
>> 
https://github.com/NextThingCo/CHIP-buildroot/commit/f3334df58611ff3cae5
fd62906423fdce3d80d24
>> https://github.com/NextThingCo/CHIP-buildroot/commit/c4457eba3099f5ca
514c06bb35b42772178a151a
>>
>>
>> 
It is not ideal because it relies on a separate dtc-overlay package,
>> which packages a different version of dtc, which Antoine has
>> cooked on his own github repository.
>> 
>> We really need to find a solution that is acceptable in the
>> upstream Buildroot, and applies to multiple platforms.
> 
> Just thinking out loud: we could add an option to the dtc package
> that selects the overlay version.
> 
> The canonical approach, however, would be to convert dtc to a
> virtual package with a dtc-kernel-org and a dtc-overlay
> implementation.


I looked into this a bit more:
* The u-boot doesn't need the host DTC (even though the
BR2_TARGET_UBOOT_NEEDS_DTC is set in the patch i sent, something i'll
need to fix in the next iteration)

* As the shipped .dtb files are built with the dtc version included in
the linux tree from https://github.com/beagleboard/linux.git, which
has the support for the overlays, so for merely getting a booting
system, no need to hack the dtc package

* As the kernel build also installs this dtc version as
'output/host/usr/bin/linux-dtc', if one needs to compile overlays on
the build host, s/he can use that one (although this need to be
documented at least in the board's README)

* if the user want's to use dtc on the target s/he needs to enable
BR2_PACKAGE_DTC_PROGRAMS, which will fail unless it has been patched

 I'm also not sure what would be the best. I couldn't find any solid
reference now, but i would suspect/hope that this feature will hit the
mainline dtc, so maybe we don't need a long-term solution for this,
but i'm also just thinking out loud...

So as far i can see the options are (and none of them is ideal):

1. Implementing a similar solution as Antoine with an additional
dtc-overlay package with a custom upstream repo.

2. Stick to the current package and upstream, but introduce a config
variable like "BR2_PACKAGE_DTC_SUPPORT_OVERLAY", and if it's set, the
needed patchset is applied (or just using an other upstream)

3. Create a virtual package and 2 implementations as dtc-kernel-org
and a dtc-overlay

4. Only add the needed patches on the boards where needed and patch
dtc by setting BR2_GLOBAL_PATCH_DIR

5. Introducing custom repository/custom patch dir config options for
the dtc package like for u-boot and linux (maybe also with an option
to use the dtc source coming with the kernel tree?)

 And these are just covering the cases when the dtc version in the
kernel tree supports the overlay feature (like in the current case
with beagleboard), so only the host tool dtc and the target dtc need
to be specially treated.




Regards
zgyarmati
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJWmH/dAAoJEAGmEeeR8iVhNsoIAIRA/cIXoHSmkv76CdX2HHGV
jYnwgEWsIimTH7KuXdvnhDc5pXSYisq83U9Clq+vN2e1jsQp8asB5LC0E8xCIwsq
YHhPYO+g4wboFYTLz4ZlGpJ9FJdZ0qNjfCI4MavUuSXEifbIHVV2Vllkm90ttQB8
T/8QoP0y5a/COLt3DnpMwKzeEAmrIzDQIMKpON3bAwjyJ9/XixwmA665CFHMy7DJ
y9aj6y1uB2ohJdMl8oTX7mJcmLn0J/nd264XepF3p5sJ16JWK4J+ofe22daONnNk
mvrLumrzNh09UvDLxGDU0YJQ8STO8O0DZbwMEKi+widDJnd4NxGDH3nSZW331t0=
=hw93
-----END PGP SIGNATURE-----
