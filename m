From: Nathaniel Roach <nroach44@gmail.com>
Date: Sun, 05 Oct 2014 21:01:43 +0800
Subject: [Buildroot] [PATCH] bandwidthd: fix static build
In-Reply-To: <20141005144043.7b3aaac0@free-electrons.com>
References: <7d38491011008b60f8ad91ec0261af046d453685.1412232567.git.baruch@tkos.co.il>	<542CFECE.9020103@gmail.com>	<20141002075203.GG3006@sapphire.tkos.co.il>	<542D0518.3050704@gmail.com>	<20141002075844.GH3006@sapphire.tkos.co.il>	<542D0BC9.4060905@gmail.com>	<20141002083349.GI3006@sapphire.tkos.co.il>	<542E43A7.6080003@gmail.com>	<20141005045037.GA2567@sapphire.tkos.co.il>
 <20141005144043.7b3aaac0@free-electrons.com>
Message-ID: <54314137.7020007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/10/14 20:40, Thomas Petazzoni wrote:
> Baruch, Nathaniel,
> 
> On Sun, 5 Oct 2014 07:50:37 +0300, Baruch Siach wrote:
> 
>>> Hi Baruch, I didn't end up using pcap-config, but could you check git
>>> version 4b07a0b3d3a280cdde582060cb29f3333ba4bf6e for me? It seems to
>>> work in the config you pasted above and I haven't had any issues in my
>>> other tests.
>>
>> I can confirm that upgrading bandwidthd to 
>> 4b07a0b3d3a280cdde582060cb29f3333ba4bf6e fixes the build of the config above. 
>> I still think that holding the complete knowledge of all your indirect 
>> dependencies, mandatory and optional, is not robust. A better future proof 
>> solution IMO is to use tools like pkg-config (or pcap-config in the case of 
>> libpcap) to list all dependencies that are in actual use for this specific 
>> build. But this is your call as upstream.
> 
> I definitely agree with Baruch here. Using pkg-config is much more
> robust, as it figures out the indirect dependencies automatically,
> without hardcoding them in bandwidthd and/or Buildroot.
> 
> However, Baruch patch doesn't seem to be fully correct: it does both a
> PKG_CHECK_MODULES on libpng, and an AC_CHECK_LIB, which seems a bit
> redundant.
> 
> Therefore, Nathaniel, since you're now the upstream developer, could
> you make the necessary changes in configure.ac to use pkg-config
> instead, and then send a patch updating Buildroot to a new version of
> bandwidthd ?
> 
> In the mean time, I'll mark:
> 
>   http://patchwork.ozlabs.org/patch/395809/
>   http://patchwork.ozlabs.org/patch/381899/
> 
> as 'Changes requested'.
> 
> Thanks,
> 
> Thomas
> 

Thomas, Baruch:

Yeah, I'm starting to lean that way too. Although I was a little
hesitant adding another build dependency, I now realise that it's
probably getting built anyway, and the version that's currently up on
github was more a case of "getting it to work".

I've had a look at pcap-config and it doesn't seem to do -lpthreads (or
from what I could see anything useful in this case), so I'll likely
adapt Baruch's original patch into upstream for both lpcap and lpng.

It might take me a few days as my study load has increased, but I'll get
it done.

Thanks,

Nathaniel.
