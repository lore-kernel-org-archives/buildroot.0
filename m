From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Apr 2017 22:21:28 +0200
Subject: [Buildroot] [PATCH] gcc: Fix build failure related to -fPIC for
 x86_64 -> i686 builds
In-Reply-To: <8b7a3f29-c200-4292-8efb-8f6f24c3e7c7@cesnet.cz>
References: <71cfdaf7-367d-44de-a1c6-9041e269c8de@cesnet.cz>
 <aded779d-fd0d-e83c-5a3e-d0e7b28b5dfe@mind.be>
 <8b7a3f29-c200-4292-8efb-8f6f24c3e7c7@cesnet.cz>
Message-ID: <4697e49d-c953-cf51-2361-3e5d06bdd21b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-04-17 13:19, Jan Kundr?t wrote:
> On pond?l? 24. dubna 2017 0:06:30 CEST, Arnout Vandecappelle wrote:
>>  Indeed. However, I wonder, won't you have a similar problem with other host
>> packages that try to build something without -fPIC?
> 
> Here's a list of host packages that I built with no additional patches:
> 
[snip an impressive list of packages]
> 
> When I try to rebuild some of them (`make host-$foo-rebuild`), I don't see any
> actual compilation for those that I tried (acl, kmod, swig).

 Indeed, foo-rebuild will just call 'make' again, but since nothing changed it
will not actually compile anything. If you want to do a clean rebuild you have
to do 'make foo-dirclean foo'


> It seems to me that
> (except for the toolchain) the compilation is only performed when rebuilding the
> package for the target, 

 Nope, target behaves the same. Even if you changed the toolchain configuration,
'make foo-rebuild' will not rebuild much... foo-rebuild is meant mainly for
OVERRIDE_SRCDIR use cases.

> and in that case, the newly built toolchain which has
> been previously built by Buildroot gets invoked. I.e., the host GCC doesn't get
> triggered after a toolchain has been built, as far as I can see now.
> 
> Am I missing something? Is there a host package that I should try to get
> built/rebuilt?

 No, if you managed to build all these host packages with the default-PIE host
compiler, then I guess it's OK.

> 
>>> BTW, I cannot find my original submission on patchwork. Was that e-mail OK? I
>>> see it in the ML archive [3].
>>
>>  I believe it's because you sent it base64-encoded, patchwork only likes
>> plaintext. You didn't use git send-email, did you?
> 
> The copy of the original patch submission that I have in my sent folder doesn't
> appear to be base64-encoded -- it was a result of a `git format-patch` with no
> additional transformation after all.

 The mail I received through the mailing list was base64-encoded.


> However, I noticed that the outgoing e-mail was missing a Message-ID header, and
> it seems legit to reject these messages for various reasons.

 That could indeed be the reason as well. Checking in patchwork sources... Yes
indeed, it checks for From, Subject and Message-Id and drops the mail if those
are not there.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
