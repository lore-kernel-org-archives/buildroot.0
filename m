From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Jul 2017 23:34:01 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: export O= to
 post-build/image scripts for out-of-tree builds
In-Reply-To: <871spe92ci.fsf@dell.be.48ers.dk>
References: <20170714130417.18857-1-peter@korsgaard.com>
 <7d2448b0-800c-cb14-657b-907d380787f8@mind.be>
 <871spe92ci.fsf@dell.be.48ers.dk>
Message-ID: <dca9fa93-e6f8-10d9-f166-02f981b4f0a3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-07-17 23:32, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > On 14-07-17 15:04, Peter Korsgaard wrote:
>  >> Sometimes it can be interesting to call back into buildroot from a
>  >> post-build/image script (E.G. make printvars or similar). For this to work
>  >> correctly with out-of-tree builds we need to pass O= to make, but this is
>  >> currently not available in the environment of post-build/image scripts.
>  >> 
>  >> In concept, O could be derrived from BUILD_DIR (E.G. by stripping /build),
>  >> but directly exporting O is cleaner.
>  >> 
>  >> O= cannot be exported globally as it interferes with various build systems,
>  >> so instead add it to EXTRA_ENV.
> 
>  >  I'm too late with this comment, but why is BASE_DIR not sufficient? It is
>  > already exported, and it is set to:
> 
>  > BASE_DIR := $(CANONICAL_O)
> 
> Yes, that can also work - Even though it is less obvious that you should
> run make O=${BASE_DIR} inside the post build/image scripts, instead of
> make O=$O

 OK, but having both exported seems a bit silly...


>  >  O has the problem that it's too risky to lead to conflicts IMO.
> 
> Even for post build/image scripts? What use cases do you have in mind
> where there could be conflicts?

 True, in EXTRA_ENV the risk is minimal - especially since Kbuild and
derivatives (like Buildroot) ignore an O passed through the environment.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
