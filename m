From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Apr 2014 17:29:05 +0200
Subject: [Buildroot] Adding google-breakpad to buildroot
In-Reply-To: <1398262906.30640.4.camel@mbpro.localhost>
References: <1398262906.30640.4.camel@mbpro.localhost>
Message-ID: <5357DC41.6020608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/04/14 16:21, Pascal H?rst wrote:
> Hi everyone,
> 
> we are planing to add google-breakpad to buildroot. 
> 
> From the project description at
> http://code.google.com/p/google-breakpad/:  
> 
> [...] "Breakpad is a library and tool suite that allows you to
> distribute an application to users with compiler-provided debugging
> information removed, record crashes in compact "minidump" files, send
> them back to your server, and produce C and C++ stack traces from these
> minidumps." [...]
> 
> Adding a package to buildroot is easy, but in this case we will have to
> find a way to extract all symbols from the target binaries, before they
> get stripped. My idea was to add a new target to the Makefile, just
> before "target-finalize:" and check against an option in the config
> like:
> 
> ifeq ($(BR2_ENABLE_BREAKPAD),y)
>         TARGETS+=target-generate-breakpad-symbols
> endif
> 
> and then:
> 
> target-generate-breakpad-symbols:
>         extract symbols and deploy result to output/images 
> 
> Is this basically the way to go, or is there a better way to achieve
> this?

 It is easier to add it to the target-finalize target. Then you can be
sure that the ordering is correct (target-finalize already has all the
needed dependencies). You can also easily use conditions there (it's not
inside a define).

 However, I think it will be more appropriate to implement breakpad as an
additional strip alternative. You probably don't want to combine strip
with breakpad... Currently we have none, strip or sstrip, it should be
relatively easy to add breakpad as an additional option. Note, however,
that the strip code is very old, it doesn't satisfy our coding style so
we'll probably want you to do some cleanup first. Also, it is currently
untested in the autobuilders AFAIK.


 Regards,
 Arnout

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 880 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140423/bbd825f8/attachment.asc>
