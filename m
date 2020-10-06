From: Akshay Bhat <akshay.bhat@timesys.com>
Date: Tue, 6 Oct 2020 17:14:54 -0400
Subject: [Buildroot] [PATCH 01/17] cpe-info: new make target
In-Reply-To: <20201006134250.22738-2-gregory.clement@bootlin.com>
References: <20201006134250.22738-1-gregory.clement@bootlin.com>
 <20201006134250.22738-2-gregory.clement@bootlin.com>
Message-ID: <CACrMeVAtsn73PiHW0bJA+6cDG5ZMnLHgYrr0JN7GJpB3Ls5Rug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Oct 6, 2020 at 9:43 AM Gregory CLEMENT
<gregory.clement@bootlin.com> wrote:
>
> From: Matt Weber <matthew.weber@rockwellcollins.com>
<snip>
> +$(2)_CPE_ID_VENDOR ?= $$($(2)_NAME)_project
> +$(2)_CPE_ID_NAME ?= $$($(2)_NAME)
> +$(2)_CPE_ID_VERSION ?= $$($(2)_VERSION)
> +$(2)_CPE_ID ?= $$($(2)_CPE_ID_VENDOR):$$($(2)_CPE_ID_NAME):$$($(2)_CPE_ID_VERSION)

Overall this is a big step in the right direction :)

A future enhancement would be to support multiple CPE_ID's for the same package:
Example 1: CVE can be reported against a library or utility
https://nvd.nist.gov/vuln/detail/CVE-2019-3823
cpe:2.3:a:haxx:libcurl:*:*:*:*:*:*:*:*
https://nvd.nist.gov/vuln/detail/CVE-2019-5482
cpe:2.3:a:haxx:curl:*:*:*:*:*:*:*:*

See below of how Yocto handles the same:
The format they follow is space separated CPE_VENDOR:CPE_NAME for all
combinations to be checked:
https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-support/curl/curl_7.72.0.bb#L15
Note: Curl is the worst case offender, because older curl CVEs used to
have a different vendor!

Here are few examples of packages needing multiple mappings:
https://github.com/OSSystems/meta-browser/blob/master/recipes-browser/chromium/chromium.inc#L4
https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-graphics/libsdl2/libsdl2_2.0.12.bb#L32
https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-graphics/xorg-lib/libxfont2_2.0.4.bb#L24
https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-extended/ghostscript/ghostscript_9.52.bb#L123

Other naming inconsistencies examples of the top of my head:
xorg-server vs x_server
https://nvd.nist.gov/vuln/detail/CVE-2019-17624
cpe:2.3:a:x.org:x_server:*:*:*:*:*:*:*:*
https://nvd.nist.gov/vuln/detail/CVE-2018-14665
cpe:2.3:a:x.org:xorg-server:*:*:*:*:*:*:*:*
libsdl vs simple_directmedia_layer
https://nvd.nist.gov/vuln/detail/CVE-2019-13626
cpe:2.3:a:libsdl:libsdl:*:*:*:*:*:*:*:*
https://nvd.nist.gov/vuln/detail/CVE-2019-12222
cpe:2.3:a:libsdl:simple_directmedia_layer:2.0.9:*:*:*:*:*:*:*

While some of these should be reported to NVD and fixed, practically
the number of such CVEs is significant to follow and fixup. Might be
easier to add tooling support to query multiple CPE_ID*'s like how
Yocto does.
This could be a future enhancement given the proposal here is
definitely better than what currently exists in Buildroot :)

Thanks,
Akshay
