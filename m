From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 29 Oct 2014 09:21:57 +0100
Subject: [Buildroot] [PATCH] unzip: Use the "-q" option to silence
 unzipping of source files
In-Reply-To: <54500D06.3020005@mind.be>
References: <1414489391-8707-1-git-send-email-fabio.porcedda@gmail.com>
 <54500D06.3020005@mind.be>
Message-ID: <CAHkwnC-h41Cv=P9v3HRR-tMVHTVBBZQX2FQYnBt42MG3np0E4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
thanks for reviewing.

On Tue, Oct 28, 2014 at 10:39 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 28/10/14 10:43, Fabio Porcedda wrote:
>> Add and use the "UNZIP" variable instead of calling directly unzip
>> because the variable contains the "-q" option to silence "unzip" so it
>> doesn't show the list of files extracted just like when tar files are
>> being unpacked.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> ---
>>  boot/at91bootstrap/at91bootstrap.mk            | 2 +-
>>  package/Makefile.in                            | 1 +
>>  package/espeak/espeak.mk                       | 2 +-
>>  package/explorercanvas/explorercanvas.mk       | 2 +-
>>  package/gtest/gtest.mk                         | 2 +-
>>  package/jquery-mobile/jquery-mobile.mk         | 2 +-
>>  package/jquery-ui-themes/jquery-ui-themes.mk   | 2 +-
>>  package/jquery-ui/jquery-ui.mk                 | 2 +-
>>  package/jquery-validation/jquery-validation.mk | 2 +-
>>  package/libjson/libjson.mk                     | 2 +-
>>  package/opentyrian-data/opentyrian-data.mk     | 2 +-
>>  package/python-keyring/python-keyring.mk       | 2 +-
>>  package/rapidjson/rapidjson.mk                 | 2 +-
>>  package/sam-ba/sam-ba.mk                       | 2 +-
>>  package/urg/urg.mk                             | 2 +-
>>  package/zxing/zxing.mk                         | 2 +-
>>  16 files changed, 16 insertions(+), 15 deletions(-)
>>
>> diff --git a/boot/at91bootstrap/at91bootstrap.mk b/boot/at91bootstrap/at91bootstrap.mk
>> index e3f9dc0..0c10296 100644
>> --- a/boot/at91bootstrap/at91bootstrap.mk
>> +++ b/boot/at91bootstrap/at91bootstrap.mk
>> @@ -17,7 +17,7 @@ AT91BOOTSTRAP_INSTALL_IMAGES = YES
>>  AT91BOOTSTRAP_INSTALL_TARGET = NO
>>
>>  define AT91BOOTSTRAP_EXTRACT_CMDS
>> -     unzip -d $(BUILD_DIR) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
>> +     $(UNZIP) $(BUILD_DIR) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
>>       mv $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)/* $(@D)
>>       rmdir $(BUILD_DIR)/Bootstrap-v$(AT91BOOTSTRAP_VERSION)
>>  endef
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index ff2ee2d..c655bd4 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -221,6 +221,7 @@ INSTALL := $(shell which install || type -p install)
>>  FLEX := $(shell which flex || type -p flex)
>>  BISON := $(shell which bison || type -p bison)
>>  SED := $(shell which sed || type -p sed) -i -e
>> +UNZIP := $(shell which unzip || type -p unzip) -qd
>
>  -qd doesn't look right - the -d option should be followed with the directory in
> which to extract. In some places you replaced "unzip -d" with "$(UNZIP)", in
> other places it was "unzip .... -d ..." which you replaced with "$(UNZIP) ....
> -d ...".

Nice catch, I will fix it.

>
>  I'm not in favour of splitting options like this. So I'd remove the -d from UNZIP.

Ok i will remove it.

Thanks & BR
-- 
Fabio Porcedda
