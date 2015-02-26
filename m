From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 26 Feb 2015 21:54:21 +0100
Subject: [Buildroot] Driver for C-Media Electronics,
 Inc. CM106 based usb audio device?
Message-ID: <trinity-47849913-e383-4ff5-93a0-78074e46f85e-1424984060999@3capp-gmx-bs21>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lou,

On Wed, Feb 25, 2015 at 07:53:01PM -0600, Lou Crittenden wrote:
> >I was able to compile and run a rockbox version on RPi/buildroot, but still
> > without audio file playing...
> 
> Awesome! Can I see it?

See buildroot patch at end of e-mail (very early, very hackisch version)...

> 
> I was able to run mplayer with no options in a terminal within the raspbian
> image that came with my waveshare device and it didn't have a bit of
> problems with the audio. It sounded great actually.
> 

Do you have audio distortions too in case of leds blinking etc.?
If no its definitely not a pure electric problem..., if yes try another
sound device...

> You're probably right on the resource part, and I believe the buildroot
> kernel has a lot to do with it, but the raspbian kernel didn't have that
> issue at all, but of course it just takes a long time to boot compared to
> buildroot. I want to use the isolator to isolate the usb sound device from
> the background zipper noises, pops, buzzes, whining, and other garbage from
> the main computer board that happens when for example you are scrolling a
> page or leds on the board blink.
> 

Sounds strange...

> I have included a sample of what I am running into as far as the audio.
> This was with the commands:
> 
> # cd /media/usb0 (this thumbdrive is where my music is located)
> # mplayer *
> 
> and with my usb sound device plugged in. It doesn't do that with the
> onboard card, though (even though it sounds like poo, as I have heard it
> was only 11-bit audio). When I'm running:
> 
> # mplayer -quiet *
> 
> it plays normally through the usb card even with other processes running,
> but still doesn't sound near as good as either my ubuntu system or the
> raspbian image.
>
> [-- Attachment #2: garbled mplayer no flags switching songs.mp3 --]
> [-- Type: audio/mpeg, Encoding: base64, Size: 743K --]

Strange, but I would suspect some kernel/driver problem, try to copy
the sound files to the local filesystem, unplug your usb-memory and
try with only the usb-soundcard attached (just guessing, not much
help without hardware to test)...

Try to find out the difference between raspbian and buildroot
kernel version/config...

> I also found out that the snd-usb-audio driver indeed does work with all of
> the channels when I input the command
> 
> # speaker-test -Dplug:surround51 -c6
> 
> to test all of the speaker channels. The woman's voice came through on all
> the appropriate channels, plus they are adjustable in alsamixer. I just
> can't get mplayer to use them all when using alsa as the backend (I haven't
> gotten pulseaudio to work in buildroot) and it outputs through the front
> only. I have the same issue when using alsa as the backend on this card in
> the raspbian image as well (but good sound) yet it uses the same
> snd-usb-audio driver, same with my ubuntu system.
> 
> Would you recommend pulseaudio in my situation?
> 

Should work with alsasound directly....but you can never know..., sorry I am
no alsa-/pulse sound expert...

Regards,
Peter

> 
> On Wed, Feb 25, 2015 at 1:42 PM, Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Hello Lou,
> >
> > On Tue, Feb 24, 2015 at 05:58:45PM -0600, Lou Crittenden wrote:
> > > Good news, I found a workaround to the garbled audio issue on use of
> > > mplayer when using my USB card. What I have to do is pass the -quiet
> > option
> > > when running mplayer. For example: mplayer -quiet test.mp3. It turns out
> > > that activity on the lcd screen was the culprit, and it interferes with
> > the
> > > audio and it ONLY does that when using the usb audio card. When no
> > options
> > > are passed, the display continually scrolls the time and whatnot of the
> > > audio playback every millisecond.
> > >
> > > mpg123 has much less terminal activity, and thus doesn't have the issue.
> > >
> > > I was wondering if this is a power issue and if it would work if I used
> > an
> > > isolator that allowed the device to receive its own power independent of
> > > the Raspberry Pi board? Something like this:
> > >
> > >
> > http://www.ebay.com/itm/ADUM4160-USB-Isolator-Board-ADI-USB-Port-Isolator-Protection-/191303685123?pt=LH_DefaultDomain_0&hash=item2c8a969403
> > >
> > > that electronically isolates the usb audio and power from the pi, but
> > > allows the pi to talk to the device so the sound improves and improves
> > > power stability.
> > >
> >
> > Hard to tell without hearing a sample of what you describe as 'garbled
> > audio',
> > but I would less suspect a electrical/decouple problem, more suspect a pure
> > resource problem of the mplayer aplication doing audio and display
> > updates...
> >
> > Maybe you can stress mplayer -quiet and/or mpg123 doing some concurrent
> > work/
> > testbench running (e.g. untar a huge file (kernel source)), etc. and get
> > the
> > same audio defects?
> >
> > I was able to compile and run a rockbox version on RPi/buildroot, but still
> > without audio file playing...
> >
> > Regards,
> > Peter
> >

---begin---
