From: Akshay Bhat <akshay.bhat@timesys.com>
Date: Tue, 25 Feb 2020 14:21:52 -0500
Subject: [Buildroot] CVEs not matching buildroot packages
Message-ID: <CACrMeVDQ39Phv7t6jpJBhoJSC_+H6oeO+JL61YwOarK5v2Ah9Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael, Thomas,

> On Tue, 25 Feb 2020 11:19:20 +0100
> Michael Walle <michael@walle.cc> wrote:
>> You could assume that
>> the product name is unique and if its not you could add the vendor.
>> Like for example:
>>
>>   _CPE = linux_kernel
>>   _CPE = linux:linux_kernel
>>
>> eg. something like that:
>>   pkg_CPE = [vendor:]product
>>
>> Maybe it shouldn't be named CPE after all.. But I wanted to avoid
>> this discussion for now, because it doesn't matter for the mapping
>> problem ;)

Few things to consider:
1. The proposed pkg_CPE product will need to map to multiple NVD CPE products.
Example 1: CVE can be reported against a library or utility
curl (CVE-2019-15601 cpe:2.3:a:haxx:curl), libcurl (CVE-2019-3823
cpe:2.3:a:haxx:libcurl)
So the CVE check logic for curl package in buildroot would need to
iterate through CVE's for both curl and libcurl CPE product entries...
Same goes for packages like flac/libflac, I can help provide a more
exhaustive list at a later point.
Example 2: Naming inconsistencies in NVD (Same package having multiple
CPE product entries)
simple_directmedia_layer(CVE-2019-12222
cpe:2.3:a:libsdl:simple_directmedia_layer), sdl (CVE-2017-2888
cpe:2.3:a:libsdl:sdl:2.0.5), libsdl (CVE-2019-13626
cpe:2.3:a:libsdl:libsdl)
arm-trusted-firmware (CVE-2017-15031
cpe:2.3:o:arm:arm-trusted-firmware:*:*:*:*:*:*:*:*),
arm_trusted_firmware (CVE-2016-10319
cpe:2.3:o:arm_trusted_firmware_project:arm_trusted_firmware:1.2:*:*:*:*:*:*:*),
trusted_firmware-a (CVE-2018-19440
cpe:2.3:a:arm:trusted_firmware-a:*:*:*:*:*:*:*:*)
....
Though ideally some of these should be fixed by sending NVD an email.

2. Being able to specify the vendor would be nice to have. In my
experience it reduces false positives in certain packages but then
again it leads to missed CVEs (naming inconsistencies in the CVE
vendor) in certain other packages. So specifying it on a need only
basis would be ideal.
Example 1: Reduced false positive because multiple vendors might have
same product
subversion (CVE-2020-2111 cpe:2.3:a:jenkins:subversion vs
CVE-2019-0203 cpe:2.3:a:apache:subversion)

3. An option to specify CVE version would be helpful for certain usecases
Example 1: Boards might use a git tag for the version number that is
unrelated to upstream version numbering scheme.
Most of the i.MX boards (eg: freescale_imx7dsabresd_defconfig) set
incorrect version number for u-boot (eg:
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga")
This leads to missed CVE reporting in u-boot package.
Example 2: NVD might use a different versioning scheme than upstream
or buildroot
libkrb5 buildroot version: 1.18; NVD version format 5-x.xx
(CVE-2019-14844 5-1.17)
berkeleydb buildroot version: 5.3.28; NVD version format 11.2.5.3.28
(CVE-2015-4790)

See ELC presentation slides 17/22/23 for more info on NVD data quality
analysis (based on Timesys's experience developing CVE monitoring tool
called Vigiles):
https://elinux.org/images/0/0a/Open-Source-CVE-Monitoring-and-Management-V3.pdf

>> > Yes. With the release-monitoring.org matching, we are able to know if
>> > the match was found thanks to an explicit mapping of the Buildroot
>> > distribution, or if it was found by "luck". That's the difference
>> > between "found by distro" and "found by guess" in
>> > http://autobuild.buildroot.net/stats/.
>>
>> Mhh, I don't think I can follow you here. Even if the package is found
>> in release-monitoring.org it doesn't map to any CVEs/CPEs, does it?
>> Or should this be an example on already existing fuzzy matching in
>> buildroot?
>
> Of course release-monitoring.org is completely unrelated from
> CVEs/CPEs. I was mentioning release-monitoring.org as another case in
> Buildroot where we have an issue with mapping Buildroot package names
> with package/project names used by another entity.
>
> But now that I think of it, why not rely a bit more on
> release-monitoring.org after all? We could add a NVD distribution to
> release-monitoring.org, and use it to store the mapping between
> release-monitoring.org projects and their corresponding CPE IDs.
>
> Then, Buildroot can query release-monitoring.org to find the CPE IDs.
> One advantage of this approach is that this CPE ID information in
> release-monitoring.org is not only useful for Buildroot, but
> potentially for any other project using release-monitoring.org.

This is a great idea for long term collaboration between distros! I am
not very familiar with the release-monitoring.org mapping between
distros but one idea for an initial first pass to identify *potential*
packages having a different NVD CPE product name:
1. Write a script to generate a list of packages with no CVEs reported
for any version of the package
2. Map the buildroot package in release-monitoring.org to say
Debian/Ubuntu and check their security trackers
(https://salsa.debian.org/security-tracker-team/security-tracker/tree/master/data
or https://git.launchpad.net/ubuntu-cve-tracker/tree/) for any CVEs
for that package. If CVEs exist then most likely the buildroot package
name to NVD CPE product name is mis-matched.

PS: I just subscribed to mailing list, so had to copy paste the email
thread from web archive. So formatting and In-Reply-To context might
be messed up, sorry!

Thanks,
Akshay
