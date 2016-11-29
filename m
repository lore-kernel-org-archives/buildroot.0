From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Nov 2016 23:52:22 +0100
Subject: [Buildroot] Investigating a parallel installation failure
In-Reply-To: <20161129095516.4d54e2c1@free-electrons.com>
References: <20161128234621.0e512742@free-electrons.com>
 <20161129023613.GB4657@tungsten.ozlabs.ibm.com>
 <20161129095516.4d54e2c1@free-electrons.com>
Message-ID: <7fee932e-5a07-2262-aa5c-d7457c0d5dd1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29-11-16 09:55, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 29 Nov 2016 13:36:13 +1100, Sam Bobroff wrote:
> 
>> I couldn't replicate this, but I tried hacking strace into the process
>> so I could see if usb_modeswitch_dispatcher was being deleted during the
>> build. It looks like it is, by the C compiler -- presumably removing the
>> existing output file before it writes a new one.
> 
> And then that makes sense, indeed.
> 
>> So you could see an interleaving where Make has seen the file but it's
>> deleted either just before, or during, /usr/bin/install. And this can
>> happen as long as Make thinks its OK to run those two rules in parallel.
>>
>> If that's correct, you could try converting the dependency on
>> usb_modeswitch_dispatcher (which, as you point out, isn't really working
>> anyway) into an order only dependency (or you could even just delete it
>> -- it doesn't seem to do anything necessary unless you're running a
>> "make install-static" without having first done a "make static" but
>> buildroot does that). This really isn't fixing the whole problem (IMHO
>> the makefile is quite broken) but it might hack around it by not forcing
>> the unnecessary recompilation thus avoiding the racy delete.
> 
> Or we simply use $(MAKE1) to build/install this package, which is
> anyway quite small, and avoid the problem altogether. I also agree that
> the Makefile is quite broken, and I'm not sure we want to fix it (it
> would require a complete rewrite).

 Still, it's unfortunate that we're doing build during the installation step. Oh
well. Upstream doesn't even have a publicly accessible VCS...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
