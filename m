From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Feb 2018 11:56:02 +0100
Subject: [Buildroot] [PATCH-FOR-NEXT v1 3/6] pkgconf: add
 host-pkg-config wrapper
In-Reply-To: <20180222104146.5d4efe6e@windsurf.lan>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-4-gael.portay@savoirfairelinux.com>
 <20180221225010.4b4228aa@windsurf.lan>
 <0e296fe2-3359-581f-6d3d-d3bc3cac06eb@mind.be>
 <20180222104146.5d4efe6e@windsurf.lan>
Message-ID: <ac315087-1cdd-a2c6-3a5c-2142137cdb79@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-02-18 10:41, Thomas Petazzoni wrote:
>>  With the PATH-based alternative, it might make sense to have the cross-stuff
>> both in $(HOST_DIR)/bin with the tuple prefix, and in $(HOST_DIR)/tuple/bin
>> without the prefix. That way, we get the advantages of both: comply with
>> autoconf expectations, and avoid breaking packages or downstream users.
>
> I'm still not convinced about changing the HOST_DIR/ organization. It's
> a massive change, affecting everything, and not just pkg-config, and
> the outcome is less nice than what we have today, for my perspective.

 Well, this extended PATH-based alternative (which is BTW what I think ThomasDS
suggested to begin with) is not at all invasive: cross-things stay in host/bin
as they are today, we just add host/tuple/bin which contains cross-things
without the tuple-prefix, and we add this to the PATH. Then in a second step, we
move pkg-config to tuple-pkg-config, BUT we also add it without prefix to
host/tuple/bin. So it doesn't break anything at all, since for target builds, we
have host/tuple/bin in PATH (and PKG_CONFIG=host/bin/tuple-pkg-config in the
environment) - behaviour is the same as before.

 There is a bit of breakage, however: host/tuple/bin/gcc will be in PATH, so any
package that calls gcc from PATH will now get target gcc instead of host gcc. On
the other hand, apparently[1], CMake doesn't have any support for building host
executables and requires a two-step approach instead; I guess most non-autotools
packages will have a similar limitation.

 So yeah, adding host/tuple/bin to PATH may not be as uninvasive as I thought...

 Regards,
 Arnout


[1]
https://cmake.org/Wiki/CMake_Cross_Compiling#Using_executables_in_the_build_created_during_the_build


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
