From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Dec 2018 21:59:37 +0100
Subject: [Buildroot] [PATCH] package/waf: purge trailig '/' from WAF_SITE
In-Reply-To: <20181210204528.6cd1409d@windsurf>
References: <20181210184559.13181-1-casantos@datacom.com.br>
 <20181210204528.6cd1409d@windsurf>
Message-ID: <8013501a-cffd-34e3-1fdd-1db64b51e4fe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/12/2018 20:45, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 10 Dec 2018 16:45:59 -0200, Carlos Santos wrote:
>> <PKG>_SITE cannot have a trailing slash.
>>
>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> 
> Odd, why isn't our check in package/pkg-generic.mk for trailing slashes
> triggering on this?
> 
> We have this:
> 
> ifeq ($$(patsubst %/,ERROR,$$($(2)_SITE)),ERROR)
> $$(error $(2)_SITE ($$($(2)_SITE)) cannot have a trailing slash)
> endif

 Because that check is within

ifeq ($$($$($(2)_KCONFIG_VAR)),y)
...
endif

and these packages are host-only packages.

 It has to be within that condition, since the _SITE may be set only or
differently based on kconfig options which are only set when the package is
selected. I tested and it fails for instance on arm-trusted-firmware if that
package is not selected.

 We need Config.in.host :-)

 Regards,
 Arnout
