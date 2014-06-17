From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue, 17 Jun 2014 11:13:34 +0200
Subject: [Buildroot] [PATCH 2/2] Makefile: test if "dot" exists in
	graph-build and <pkg>-graph-depends
In-Reply-To: <20140613171615.GD3496@free.fr>
References: <1402679208-8304-1-git-send-email-fabio.porcedda@gmail.com>
 <1402679208-8304-2-git-send-email-fabio.porcedda@gmail.com>
 <20140613171615.GD3496@free.fr>
Message-ID: <CAHkwnC9RwPoGLL+SR_eT1r8rr0E0eemSsTc0Dhfg5pZQSTmyeA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 13, 2014 at 7:16 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Fabio, All,
>
> On 2014-06-13 19:06 +0200, Fabio Porcedda spake thusly:
>> Because the "dot" command availability was checked only for the
>> "graph-depends" target so move the check to the "graph-prerequisites"
>> target to be able to check the "dot" command availability for all the
>> graph generation targets.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
>> ---
>>  Makefile               | 8 ++++++--
>>  package/pkg-generic.mk | 2 +-
>>  2 files changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 86acbbf..3e395b5 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -658,7 +658,11 @@ legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
>>  show-targets:
>>       @echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(TARGETS) $(TARGETS_ROOTFS)
>>
>> -graph-build: $(O)/build/build-time.log
>> +graph-prerequisites:
>> +     @dot -? >/dev/null 2>&1 || \
>> +             (echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1)
>
> While at it, the usual convention for this construct it to not use a
> sub-shell, but use:
>     thing-to-test || {echo MESSAGE >&2; exit 1;}
>
> Yes, the last semi-colon is needed.
>
> Because some shells might not corectly error out when a sub-shell exits
> with a non-zero error code (ie. it was the case in a previous version of
> bash.)

Thanks, fixed.

>> +graph-build: $(O)/build/build-time.log graph-prerequisites
>
> graph-build does not use 'dot', it uses matplotlib internally, so should
> probably not depend on graph-prerequisites.

Thanks, fixed.

>>       @install -d $(O)/graphs
>>       $(foreach o,name build duration,./support/scripts/graph-build-time \
>>                                       --type=histogram --order=$(o) --input=$(<) \
>> @@ -669,7 +673,7 @@ graph-build: $(O)/build/build-time.log
>>                                  --output=$(O)/graphs/build.pie-$(t).$(BR_GRAPH_OUT) \
>>                                  $(if $(BR2_GRAPH_ALT),--alternate-colors)$(sep))
>>
>> -graph-depends:
>> +graph-depends: graph-prerequisites
>>       @dot -? >/dev/null 2>&1 || \
>>               (echo "ERROR: The 'dot' program from Graphviz is needed for graph-depends" >&2; exit 1)
>
> Then you should probably remove the check here, no?

Thanks, fixed.

<snip>

Best regards
-- 
Fabio Porcedda
