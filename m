From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2019 23:31:55 +0200
Subject: [Buildroot] [PATCH next 1/4] support/gnuconfig: update to
 2019-05-28
In-Reply-To: <20190528220741.432e8d92@windsurf.home>
References: <20190528082938.5997-1-thomas.petazzoni@bootlin.com>
 <20190528082938.5997-2-thomas.petazzoni@bootlin.com>
 <87imtu7wm1.fsf@dell.be.48ers.dk> <20190528220741.432e8d92@windsurf.home>
Message-ID: <33f72710-e524-fa9a-cd43-73a2e339da83@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/05/2019 22:07, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 28 May 2019 11:32:22 +0200
> Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:  
>>
>>  > This update includes support for the C-SKY architecture.
>>  > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>>  > ---
>>  > Note: this was suggested by Peter for next, instead of just patching
>>  > the files to add csky support. It should be applied after
>>  > cherry-picking 910b431d6383cd1ce4cd9eeb0a8466cb977c3789 from master.  
>>
>> Gnuconfig isn't huge (~100KB), but I wonder if it wouldn't be nicer to
>> add a normal package (E.G. host-gnuconfig) for it (and add it to
>> _DEPENDENCIES for pkg-autotools.mk) instead of carrying the files ourselves.
> 
> It seemed like a good idea, so I took a stab at that. Unfortunately,
> our main Makefile has:
> 
> GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)

 This variable is only used to pass --build arguments during configure, so we
could use = instead of := and use the installed one from $(HOST_DIR).

 However, we can also completely remove it. There should never be any reason to
pass --build to configure - especially if you're using *exactly* the same value
as the default. This was pulled in as part of a7e49eb2af which added 7000 lines
of code. If there ever was any reason to do this, nobody remembers :-)

 Note that we still need it for libnspr because that uses $host for build, so we
have to override the --host given by the configure commands, so we need to know
what --host should be. But there we can definitely use the downloaded and
installed config.guess.

 Regards,
 Arnout

> 
> which doesn't play very well with removing config.guess from
> support/gnuconfig/config.guess. Of course, we could keep
> support/gnuconfig/config.guess just for that purpose, and use
> host-gnuconfig for everything else, but it doesn't look great.
> 
> Suggestions?
> 
> Thomas
> 
