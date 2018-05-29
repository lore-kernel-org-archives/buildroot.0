From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 May 2018 19:26:12 +0200
Subject: [Buildroot] [PATCH 6/8] ti-sgx-km: rename options to have
 proper prefix
In-Reply-To: <c932fafd-d7a1-9249-5d51-c6e4e7a45f0c@mind.be>
References: <20180513190737.26079-1-thomas.petazzoni@bootlin.com>
 <20180513190737.26079-7-thomas.petazzoni@bootlin.com>
 <20180513193140.GJ22130@scaer>
 <e477cbd2-f662-b196-0c2c-f6959e42e983@mind.be>
 <20180516090052.21e0af47@windsurf>
 <fb6a5c78-7556-4110-b52b-ea6cef274c88@mind.be>
 <87wovwiuai.fsf@dell.be.48ers.dk>
 <4299684e-6356-dcf3-a35d-9fb9ef6606bb@mind.be>
 <20180528204501.GL2965@scaer>
 <c932fafd-d7a1-9249-5d51-c6e4e7a45f0c@mind.be>
Message-ID: <20180529172612.GA8360@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-05-29 12:45 +0200, Arnout Vandecappelle spake thusly:
> On 28-05-18 22:45, Yann E. MORIN wrote:
> > Arnout, Peter, All,
> > 
> > On 2018-05-22 12:42 +0200, Arnout Vandecappelle spake thusly:
> >> On 21-05-18 23:16, Peter Korsgaard wrote:
> >>>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> >>>
> >>>  > On 16-05-18 09:00, Thomas Petazzoni wrote:
> >>>  >> Hello,
> >>>  >> 
> >>>  >> On Tue, 15 May 2018 23:52:33 +0200, Arnout Vandecappelle wrote:
> >>>  >> 
> >>>  >>>> What is nice with this solution, is that we have the new choice that is
> >>>  >>>> right near the legacy option so we can chek it, and it automatically
> >>>  >>>> gets the old setting.
> >>>  >>>> 
> >>>  >>>> But I am not too convinced, however, because we do not usually use the
> >>>  >>>> name of a choice elsewhere...  
> >>>  >>> 
> >>>  >>> Legacy is pretty special anyway. I do think it's worthwhile it to do this properly.
> >>>  >>
> >>>  >> Is this an Acked-by to the approach this patch series has taken in
> >>>  >> terms of handling the Config.in choice option renaming ?
> >>>
> >>>  >  Er, no, it's a NACK. I *do* think it's worthwhile to properly select the new
> >>>  > option.
> > 
> > Yeah, but as we've gone without support for legacy choices so far
> > (almost 6 years now), I don't think this is an urgent matter.
> 
>  Excuse me? Have you read lines 19-59 of Config.in.legacy?

Sorry, but this is not about "legacy choices" as I suggested above by
using named choices. This is about how to handle options in a choice, by
moving them to Config.in.legacy as plain booleans.

Now, to be clear:

  - yes, we do want to have proper legacy handling for the renamed
    options, as is done in commit b54c5464cc, where the old choice
    entries have been added to legacy, according to the documentation
    we had at that time and following existing practice, but which
    "forgot" the defaults for legacy [0];

  - no we don't need to have support for adding /legacy choices/ (i.e.
    using a named choice) for the 2018.05 release because it is new and
    we have so far never handled legacy choice options in a /legacy
    choice/.


[0] Fixed with this patch, which I'll submit in a moment:
    diff --git a/package/ti-sgx-km/Config.in b/package/ti-sgx-km/Config.in
    index db3d3f9ddd..562bbe8867 100644
    --- a/package/ti-sgx-km/Config.in
    +++ b/package/ti-sgx-km/Config.in
    @@ -20,6 +20,10 @@ if BR2_PACKAGE_TI_SGX_KM
     
     choice
     	prompt "Target"
    +	default BR2_PACKAGE_TI_SGX_KM_AM335X if BR2_PACKAGE_TI_SGX_AM335X # legacy
    +	default BR2_PACKAGE_TI_SGX_KM_AM437X if BR2_PACKAGE_TI_SGX_AM437X # legacy
    +	default BR2_PACKAGE_TI_SGX_KM_AM4430 if BR2_PACKAGE_TI_SGX_AM4430 # legacy
    +	default BR2_PACKAGE_TI_SGX_KM_AM5430 if BR2_PACKAGE_TI_SGX_AM5430 # legacy
     	default BR2_PACKAGE_TI_SGX_KM_AM335X
     	help
     	  Select the SOC for which you would like to install drivers.

BTW, the fallback default here is about the first option in the choice,
so it is not needed, but oh well... :-/

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > Next time, maybe I'll just shut up instead of suggesting sophisticated
> > and imaginative solutions. ;-P
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
