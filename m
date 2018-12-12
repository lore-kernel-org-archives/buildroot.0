From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 12 Dec 2018 07:59:08 -0200 (BRST)
Subject: [Buildroot] [PATCH 2/2] package/tegrarcm: select host-cryptopp
 and drop BR2_arm dependency
In-Reply-To: <cef20847-8bd5-b6e6-5a74-5a5fc3b79365@mind.be>
References: <20181212025605.19382-1-casantos@datacom.com.br>
 <20181212025605.19382-2-casantos@datacom.com.br>
 <20181212094647.57b4149d@windsurf>
 <cef20847-8bd5-b6e6-5a74-5a5fc3b79365@mind.be>
Message-ID: <794738414.2421573.1544608748810.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Arnout Vandecappelle" <arnout@mind.be>
> To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Carlos Santos" <casantos@datacom.com.br>
> Cc: "buildroot" <buildroot@buildroot.org>
> Sent: Quarta-feira, 12 de dezembro de 2018 7:04:25
> Subject: Re: [Buildroot] [PATCH 2/2] package/tegrarcm: select host-cryptopp and drop BR2_arm dependency

> On 12/12/2018 09:46, Thomas Petazzoni wrote:
>> Hello,
>> 
>> On Wed, 12 Dec 2018 00:56:05 -0200, Carlos Santos wrote:
>>> - It is not be strictly necessary to select host-cryptopp but let's do
>>>   it like other host packages do.
>>>
>>> - There is no reason to depend on the target architecture, since it's a
>>>   host tool.
>>>
>>> Yes, we could have separate commits to select host-cryptopp and drop
>>> BR2_arm dependency but that would be overkill.
>>>
>>> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
>>> ---
>>>  package/tegrarcm/Config.in.host | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/package/tegrarcm/Config.in.host b/package/tegrarcm/Config.in.host
>>> index d8cbb947d6..3411501a72 100644
>>> --- a/package/tegrarcm/Config.in.host
>>> +++ b/package/tegrarcm/Config.in.host
>>> @@ -1,6 +1,6 @@
>>>  config BR2_PACKAGE_HOST_TEGRARCM
>>>  	bool "host tegrarcm"
>>> -	depends on BR2_arm || BR2_armeb
>> 
>> The idea of this dependency is that since tegracrm is only useful in
>> conjunction with a Tegra-based system, there is not reason to build it
>> if the target isn't ARM.
>> 
>>> +	select BR2_PACKAGE_HOST_CRYPTOPP
>> 
>> So we are starting to add Config.in.host options for all packages ? Why
>> are you doing this change ? What is the motivation ?
> 
> I think it's because I said "We need Config.in.host" :-)

Right. :-)

> Carlos, the move to Config.in.host is a bit more extensive. We not only need to
> add Config.in.host files for all packages, we also need to add selects - which
> you do here.

Yes, tegrarcm is the only package depending in host-cryptopp.

> Of course we can't do it all in one big shot, but still it should probably be
> approached in a somewhat more structured way. For example, when we add a
> Config.in.host for a package, we also (perhaps in a separate commit) add the
> select statements for it in all packages that depend on it.
> 
> 
> Also note that the idea was to make these Config.in.host options blind (i.e.
> promptless).

Make sense if the host package exists only to support building another
package (that selects and depends on it) but there are other reasons
why a host package may be necessary, e.g. I need host-mtools for a
post-image script.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
