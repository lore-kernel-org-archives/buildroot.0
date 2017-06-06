From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Jun 2017 14:27:44 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: fix static linking with
	alsa
In-Reply-To: <20170605144812.36b6f0e3@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 5 Jun 2017 14:48:12 +0200")
References: <20170601203930.1069-1-bernd.kuhls@t-online.de>
 <20170601203930.1069-2-bernd.kuhls@t-online.de>
 <20170605144812.36b6f0e3@free-electrons.com>
Message-ID: <871sqxe1xb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu,  1 Jun 2017 22:39:30 +0200, Bernd Kuhls wrote:
 >> If BR2_PACKAGE_ALSA_LIB_RAWMIDI is enabled ffmpeg needs also
 >> BR2_PACKAGE_ALSA_LIB_SEQ to link against alsa.
 >> 
 >> A similar patch was committed to alsa-utils:
 >> https://git.buildroot.net/buildroot/commit/package/alsa-utils?id=c69088b8c35177cecdd0f1f385c13f5b2c509f1d
 >> 
 >> Fixes
 >> http://autobuild.buildroot.net/results/7ba/7ba485532fcab74928246a8f95dba7e5eea9d4a5/
 >> 
 >> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 > I think this is a bogus change, and that the commit
 > c69088b8c35177cecdd0f1f385c13f5b2c509f1d from Peter is equally bogus.

 > Indeed, src/rawmidi/Makefile.am contains:

 > librawmidi_la_SOURCES = rawmidi.c rawmidi_hw.c rawmidi_symbols.c
 > if BUILD_SEQ
 > librawmidi_la_SOURCES += rawmidi_virt.c
 > endif

 > So the rawmidi_virt.c code is not compiled in when --disable-seq is
 > passed. So, IMO, instead of forcing seq support, we should instead
 > adjust src/rawmidi/rawmidi_symbols.c as-is:

 > static const char **snd_rawmidi_open_objects[] = {
 >         &_snd_module_rawmidi_hw,
 > #ifdef BUILD_SEQ
 >         &_snd_module_rawmidi_virt
 > #endif
 > };

 > And I believe this patch would be upstreamable. Peter, what do you
 > think?

Calling it bogus is imho a bit harsh, but yeah - Getting it fixed
upstream so it works without seq would be nicer.

The patch was discussed and applied during the 2015.05 stablization
phase, and I chose to fix it by forcing SEQ on instead of patching the
code to work without it as that seemed the safest option. We've had a
number of issues with alsa-lib and disabled optional components in the
past (E.G. the logic we have to force PCM on):

http://lists.busybox.net/pipermail/buildroot/2015-May/128261.html

-- 
Bye, Peter Korsgaard
