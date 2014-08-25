From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 25 Aug 2014 21:16:26 +0200
Subject: [Buildroot] [PATCH v2 3/6] gendoc infra: avoid a2x warning
In-Reply-To: <CAAXf6LWUJG=DMHtkOaRvdH6TXwsSk+ut-YmgCsTKfCuE9b+KTw@mail.gmail.com>
References: <1408652748-14708-1-git-send-email-s.martin49@gmail.com>
 <1408652748-14708-4-git-send-email-s.martin49@gmail.com>
 <CAAXf6LWUJG=DMHtkOaRvdH6TXwsSk+ut-YmgCsTKfCuE9b+KTw@mail.gmail.com>
Message-ID: <CAHXCMMKGAC67J+CuxaqjU-gD9=BV7fiH_warpbippt4OqiV9tQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Fri, Aug 22, 2014 at 4:24 PM, Thomas De Schampheleire
<thomas.de.schampheleire@gmail.com> wrote:
> Hi Samuel,
>
> On Thu, Aug 21, 2014 at 10:25 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> Though the --destination-dir option works as expected, a2x displays the
>> following message when generating the pdf and text manual:
>>
>>   a2x: WARNING: --destination-dir option is only applicable to HTML based outputs
>>
>> To avoid this warning, we now just build the manual in its build location,
>> then move the generated files into $(O)/docs/manual.
>
> What you are saying is that even though there is a warning, the option
> --destination-dir is taken into account even for non-HTML based
> outputs?

AFAICS, here the --destination-dir option works as expected, even for
pdf and text outputs (the only difference is the warning).


> In that case, is it not more logical to fix the issue in a2x and
> ignore the warning for now?

Humm... I agree with this, but it is not really what the a2x history shows [1]:
You can see the commit [2] fixing the original issue only triggered
when generating pdf output (using dblatex backend) [3].
Then, the next commit [4] does kind of reverse the previous commit and
add the warning. But in the end, this particular option seems to work
correctly.

>
> Besides this general comment, see below if we pursue this patch anyway...
>
>>
>> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>
>> ---
>> changes v1 -> v2:
>> - remove remaining '-D $$(@D)' arguments in the a2x command line
>> ---
>>  docs/manual/manual.mk | 17 ++++++++++++++++-
>>  1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
>> index 044557d..42d22be 100644
>> --- a/docs/manual/manual.mk
>> +++ b/docs/manual/manual.mk
>> @@ -70,6 +70,19 @@ ifneq ($$(wildcard $$(MANUAL_$(2)_ASCIIDOC_CONF)),)
>>  MANUAL_$(2)_ASCIIDOC_OPTS += -f $$(MANUAL_$(2)_ASCIIDOC_CONF)
>>  endif
>>
>> +# Handle a2x warning about --destination-dir option only applicable to HTML
>> +# based outputs. So:
>> +# - use the --destination-dir option if possible (html and split-html),
>> +# - otherwise copy the generated manual to the output directory
>> +MANUAL_$(2)_A2X_OPTS =
>
> Why do you do this? The variable will be empty by default.

humm... remains... at first, I did: MANUAL_$(2)_A2X_OPTS =$(6)
I'll clean this.

>
>> +ifneq ($$(filter $(3),html split-html),)
>> +MANUAL_$(2)_A2X_OPTS += --destination-dir="$$(@D)"
>> +else
>> +define MANUAL_$(2)_INSTALL_CMDS
>> +       $$(Q)cp -f $$(BUILD_DIR)/$(1)/$(1).$(4) $$(@D)
>> +endef
>
> Is it really needed to have this dual approach?
> The patch would be simpler if we just use the manual install, even for
> html manuals.

The thing that makes me choose this dual approach is that for the html
output, there are the logo.png and a *.css file to copy as well.
Not really a big deal, but in case some images (or others resources)
are added, I'd prefer let a2x handles all the output files.

>
> Best regards,
> Thomas


Regards,

[1] https://code.google.com/r/c0710204-a2x/source/list
[2] https://code.google.com/r/c0710204-a2x/source/detail?r=531e926fd958b45ad99a5a64990df16e8bec37f3
[3] https://groups.google.com/forum/#!topic/asciidoc/le79ORSb1nU
[4] https://code.google.com/r/c0710204-a2x/source/detail?r=7c0bc8eacba98ad4f7f5bad838ef33d5801cc15d


-- 
Samuel
