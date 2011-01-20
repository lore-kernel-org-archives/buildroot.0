From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 20 Jan 2011 10:23:24 -0300
Subject: [Buildroot] [PATCH 10/10] mpd: new package
In-Reply-To: <87d3nrbu5k.fsf@macbook.be.48ers.dk>
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>	<1295369680-24816-11-git-send-email-gustavo@zacarias.com.ar>
	<87d3nrbu5k.fsf@macbook.be.48ers.dk>
Message-ID: <4D38374C.9000104@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/20/11 10:07, Peter Korsgaard wrote:

>  Gustavo> Add the Music Player Daemon package.
>  Gustavo> Enjoy, send me beers ;)
> 
> Come to FOSDEM and I'll buy you one ;)

Heh, that would be far more expensive that any insane amount of beer
people may throw my way :)

> I think it's a bit confusing to see the reference to mpg123 here.

It's just informative.
If you use mad to decode you get seek, but lack 24 bit love.
If you use mpg123 to decode you get 24 bit decode love but lack seek.
From what i could test mpd chooses the best one for the file you're
listening to, meaning most of the time mad.
However i lack a 24-bit encoded mp3 file to test reality (if it goes to
mpg123 for those), and also it's complicated by the fact that mpg123
won't do 24-bit on softfloat.

> Trailing space. I think it would be good to add a little note about
> when/why someone would want to use tremor instead of vorbis and
> otherwise.

Added.

> This is a bit confusing. The users sees config options to enable/disable
> support for the various plugins, but those choices are not taken into
> consideration.
> 
> E.G. if the user for some reason has faad enabled, but are not planning
> on using it with mpd, then it will still be enabled no matter what they
> set BR2_PACKAGE_MPD_FAAD2 to.
> 
> I think we should either get rid of those options, and just build
> plugins for whatever libs are enabled (not really optimal), or otherwise
> check the options here and pass the correct --enable / --disable options
> to force the corresponding plugins to be enabled or not.

Getting rid of the Config.in options will be a mess for users to know
how to get things rolling.
Most of the time mpd autodetects what it has, but not always, some
options must be explicitly enabled, case in point bzip2 support (which i
don't find really useful but added since we've got bzip2 as a package
anyway).
Is it that bad that people get a "freebie" if there's an extra supported
library around automatically enabled?
The overhead is pretty lightweight since they're all shared (unless
someone wants everything static that is).
