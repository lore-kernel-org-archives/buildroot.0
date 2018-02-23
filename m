From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 23 Feb 2018 10:06:37 +0100
Subject: [Buildroot] [PATCH v3] systemd: switch to en_US.UTF-8 locale
 when building
In-Reply-To: <20180212213400.15061-1-julius@kriukas.lt>
References: <20180131213629.4385-1-julius@kriukas.lt>
 <20180212213400.15061-1-julius@kriukas.lt>
Message-ID: <b4cc74b7-5b2c-8805-7f96-fafd9dcffa23@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Julius,

 I wanted to take the time to think of better solutions, but since I don't find
the time, here is a very quick review.


On 12-02-18 22:34, Julius Kriukas wrote:
> When BR2_REPRODUCIBLE is enabled or host uses non UTF-8 capable locale
> building systemd fails with an error:
> 
> [1/1080] Generating systemd.bg.catalog with a meson_exe.py custom command.
> FAILED: catalog/systemd.bg.catalog
> /buildroot/output/host/bin/python3 /buildroot/output/host/bin/meson --internal exe /buildroot/output/build/systemd-236/build/meson-private/meson_exe_sed_232a0623cc7ce2cd67ec72ed784b76307102ed76.dat
> Warning: You are using 'ANSI_X3.4-1968' which is not a Unicode-compatible locale.
> You might see errors if you use UTF-8 strings as filenames, as strings, or as file contents.
> Please switch to a UTF-8 locale for your platform.
> ...
> UnicodeDecodeError: 'ascii' codec can't decode byte 0xd0 in position 1079: ordinal not in range(128)

 As someone mentioned (IIRC), it's really not OK that some Python script (is it
meson or ninja?) is relying on a locale being set to work correctly. So it would
be much preferable to find out what the real problem is, and to have an
upstreamable patch that fixes it.

 That said, getting to the bottom of this is work, someone has to do it, and in
the mean time we've got a broken system, and we're about to release 2018.02. So
I'm OK to accept this workaround for the time being (and as we all now, that can
be a very long time :-).

 I would, however, like to mention explicitly in the commit message that this is
just a workaround and that really one of the underlying scripts (either meson or
ninja or something systemd-specific, TBD) is broken.


> package/pkg-generic.mk:247: recipe for target '/buildroot/output/build/systemd-236/.stamp_built' failed
> make: *** [/buildroot/output/build/systemd-236/.stamp_built] Error 1
> 
> This patch changes default host system locale from C to en_US.UTF-8 when
> building systemd package to fix this issue. It also introduces
> BR2_NEEDS_HOST_EN_US_UTF8_LOCALE flag that checks if this locale is available on
> the host system. If locale is not available error message is show and build
> process is stopped.

 The part that introduces BR2_NEEDS_HOST_EN_US_UTF8_LOCALE and uses it for
BR2_REPRODUCIBLE should be a separate patch. Indeed, when we find a better
solution for the systemd/meson issue, then we can revert this patch, but the
BR2_REPRODUCIBLE bit should stay.

 Regards,
 Arnout

> 
> Signed-off-by: Julius Kriukas <julius@kriukas.lt>

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
