From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 11 Oct 2011 10:29:13 +0200
Subject: [Buildroot] [PATCH 1/2] package: instrument to gather timing
	data
In-Reply-To: <201110110759.23066.arnout@mind.be>
References: <cover.1318176666.git.thomas.petazzoni@free-electrons.com>
 <0cbf021419332c37bd77e661c97cfc881329f1bb.1318176666.git.thomas.petazzoni@free-electrons.com>
 <201110110759.23066.arnout@mind.be>
Message-ID: <CAAXf6LXtCXk4c83xZK9os2Px9+Y2LzGnFxBt6h4puNEx-8F3dA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Oct 11, 2011 at 7:59 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On Sunday 09 October 2011 18:17:27, Thomas Petazzoni wrote:
>
>> Instrument the package infrastructure to generate a
>
>> $(O)/build-time.data file which contains one line for each step of
>
>> each package and the corresponding duration in milliseconds.
>
>>
>
>> The instrumentation is not perfect yet, as it doesn't account for
>
>> packages with overriden source directory
>
> Why is that relevant? The output goes to $(O) anyway. But this makes me
> think: wouldn't it be better to
>
>> and the build-time.data is
>
>> never removed, so results will accumulate if several partial builds
>
>> are done.
>
> I would call that a feature :-) Partial builds typically mean that you're
> hacking away at some package, and then it's very relevant to see the impact
> on build time.

How would you see the impact? Wouldn't it be more useful to save the
timing data for subsequent runs in different files (e.g. timestamped
files) so that you can compare such runs?
If you let the data accumulate, you'd get one big number for each
step/package combination, unless you're going to update the parser
script to display the different data lines as separate entities, one
for each run).

>
> Of course, there would need to be a target buildtime-clean that removes the
> files.
>
>>
>
>> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
>> ---
>
>> package/Makefile.package.in | 28 ++++++++++++++++++++++++++++
>
>> 1 files changed, 28 insertions(+), 0 deletions(-)
>
>>
>
>> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
>
>> index b5ef57b..605b518 100644
>
>> --- a/package/Makefile.package.in
>
>> +++ b/package/Makefile.package.in
>
>> @@ -254,6 +254,18 @@ define sep
>
>>
>
>> endef
>
>>
>
>> +define savetime
>
>> + echo $$(($$(date +%s%N)/1000000)) > $(O)/.br.time
>
>> +endef
>
>> +
>
>> +define outputtime
>
>> + newtime=`echo $$(($$(date +%s%N)/1000000))` ; \
>
>> + oldtime=`cat $(O)/.br.time` ; \
>
>> + rm -f .br.time ; \
>
>> + timediff=$$(($$newtime-$$oldtime)) ; \
>
>> + echo "$(1),$(2),$$timediff" >> $(O)/build-time.data
>
> Is there a particular reason to use a make function parameter in a place
> like this instead of using $($(PKG)_NAME) directly? I've seen this in other
> places in buildroot as well...
>
> [snip]
>
> Regards,
>
> Arnout
>
> --
>
> Arnout Vandecappelle arnout at mind be
>
> Senior Embedded Software Architect +32-16-286540
>
> Essensium/Mind http://www.mind.be
>
> G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
>
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>
> GPG fingerprint: 31BB CF53 8660 6F88 345D 54CC A836 5879 20D7 CF43
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
