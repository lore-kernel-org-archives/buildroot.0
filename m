From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Jul 2017 22:31:48 +0200
Subject: [Buildroot] [PATCH v8 08/10] external-toolchain: check if a
 buildroot SDK has already been relocated
In-Reply-To: <20170721100526.7e014194@windsurf>
References: <1500561321-6623-1-git-send-email-wg@grandegger.com>
 <1500561321-6623-9-git-send-email-wg@grandegger.com>
 <20170720232131.02e9a51d@windsurf>
 <9cca1b92-5e7e-2788-8370-59b12078396f@mind.be>
 <20170721083636.5442a2df@windsurf>
 <5dabf921-90d5-5f82-4e6b-34bcff1e2023@grandegger.com>
 <20170721092401.121b48b1@windsurf>
 <5954a27f-ac93-99ee-5216-2cc73b15385b@grandegger.com>
 <20170721100526.7e014194@windsurf>
Message-ID: <5146353d-87cc-cea2-0529-a07919d1f8a2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-07-17 10:05, Thomas Petazzoni wrote:
[snip]
>>> For a SDK to be usable as an external toolchain, it has to be
>>> a SDK that contains *just* a toolchain and *nothing* else. If its
>>> sysroot is polluted with additional libraries than the C library, it
>>> cannot be used as an external toolchain.

 This is not true. I already regularly use a Buildroot SDK in projects by
setting BR2_HOST_DIR=/opt/... and packaging that. This SDK is then used to
create a rootfs+kernel with Buildroot, and separately to build applications.
Since the applications need some additional libraries, these libraries are
included in the SDK. They are not used by Buildroot, so it's double work (they
are included in the SDK, and built again for the target rootfs).

 Admittedly it's not perfect, but it works. At least, as long as you don't go
and update Buildroot (thus putting new versions of the libraries on the target)
without updating the SDK as well.

 However...

>>> And therefore, the
>>> relocate-sdk procedure is useless, because there's nothing to relocate
>>> in an SDK that is just a toolchain.  
>>
>> OK. I see. Then I will drop this patch.
> 
> Let's see if Arnout agrees with my reasoning. Quite often he points me
> at details I have missed :-)

 relocate-sdk is still useless when using it as an external toolchain. You could
say it makes sense for a pre-installed toolchain, but then only if you're using
that SDK outside of Buildroot. Buildroot is not going to use any of the
additional stuff.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
