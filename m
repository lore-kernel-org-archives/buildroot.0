From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Mar 2016 01:01:13 +0100
Subject: [Buildroot] [PATCH 1/8] core: add the possibility to provide
 help for local, custom rules
In-Reply-To: <20160310202257.GB3424@free.fr>
References: <cover.1457561521.git.yann.morin.1998@free.fr>
 <bfe81981928f750dacb4df568ff7e7a1fdd88790.1457561521.git.yann.morin.1998@free.fr>
 <56E0B355.2070309@mind.be> <20160310202257.GB3424@free.fr>
Message-ID: <56E20AC9.4000506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/16 21:22, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2016-03-10 00:35 +0100, Arnout Vandecappelle spake thusly:
>> On 03/09/16 23:22, Yann E. MORIN wrote:
>>> When using a br2-external tree, it is possible (as stated in our manual)
>>> to implement whatever arbitrary extra make rules (such as flashing a
>>> board, or extracting the rootfs in an NFS export...). Some of those
>>> extra rules might be exposed to the user as new entry points that the
>>> user can call by itself.
>>>
>>> However, there is no way for the br2-external to advertise those new
>>> rules in the help text.
>>>
>>> We add the possibility to do so, by adding a new make rule, called
>>> help-local, advertised in our own help info.
>>>
>>> It is up to the br2-external tree to provide whatever help text is
>>> deemed necessary.
>>>
>>> Note that we need to provide an empty, dummy help-local' rule, since it
>>> is always advertised. Since this rule is empty, make gently reports that
>>> there is "Nothing to be done for `help-local'", which is pretty well
>>> fitting when help-local was not provided (either because there's no
>>> br2-external tree, or when the br2-external tree does not provide it.
>>>
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> Cc: J?r?me Pouiller <jezz@sysmic.org>
>>> Cc: Arnout Vandecappelle <arnout@mind.be>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>>> ---
>>>   Makefile | 6 ++++++
>>>   1 file changed, 6 insertions(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index f2822a2..d24793b 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -966,6 +966,7 @@ endif
>>>   	@echo '  source-check           - check selected packages for valid download URLs'
>>>   	@echo '  external-deps          - list external packages used'
>>>   	@echo '  legal-info             - generate info about license compliance'
>>> +	@echo '  help-local             - print help about local, custom actions (if any)'
>>>   	@echo
>>>   	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
>>>   	@echo '  make O=dir             - Locate all output files in "dir", including .config'
>>> @@ -974,6 +975,11 @@ endif
>>>   	@echo 'it on-line at http://buildroot.org/docs.html'
>>>   	@echo
>>>
>>> +# This rule does nothing, it is expected to be overloaded by
>>> +# a br2-external tree or a local.mk . However, it must exist,
>>> +# as we reference it in the main help, above.
>>> +help-local:
>>
>>   It's sufficient and better to do
>>
>> .PHONY: help-local
>
> I tried (evenm before I submitted!) and it does not work. It still
> prints that there is nothing to do...
>
> Here's my test case:
>
>      $ cat Makefile
>      .PHONY: help
>      help:
>
>      $ make help
>      make: Nothing to be done for `help'.

  But that's also the case with the empty rule, no?

  My point was: if you just declare it phony, it will have the same effect. In 
addition, you've declared it phony already which is really what we want in the 
end. And finally, when declaring it phony, there's no need to add a comment 
because it's obvious that it's a phony target.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
