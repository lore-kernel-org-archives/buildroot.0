From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 4 Oct 2013 17:29:37 +0200
Subject: [Buildroot] [PATCH 1 of 5] legal info: fix saving of host
	package licenses
In-Reply-To: <CAAXf6LWniNtQiwD0avXMHYOvEq6gCONAAgTo21HOiG+aXSc0vA@mail.gmail.com>
References: <patchbomb.1380892349@argentina>
 <d7c22445ecf6c2362d5b.1380892350@argentina>
 <CAAXf6LWniNtQiwD0avXMHYOvEq6gCONAAgTo21HOiG+aXSc0vA@mail.gmail.com>
Message-ID: <CAAXf6LUTEtCoyLLb6o+gmbxHmEPOAm6mULw4xeeCK8gFhW+60w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, Oct 4, 2013 at 3:24 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> On Fri, Oct 4, 2013 at 3:12 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> Due to a missing dollar sign, the licenses for host packages were not saved.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>> Note: Aaargh this dollar sign madness!
>>
>>  package/pkg-generic.mk |  2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -511,7 +511,7 @@ ifeq ($(call qstrip,$$($(2)_LICENSE_FILE
>>         @$(call legal-license-nofiles,$$($(2)_RAWNAME))
>>         @$(call legal-warning-pkg,$$($(2)_RAWNAME),cannot save license ($(2)_LICENSE_FILES not defined))
>>  else
>> -       @$(foreach F,$($(2)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F))$$(sep))
>> +       @$(foreach F,$$($(2)_LICENSE_FILES),$(call legal-license-file,$$($(2)_RAWNAME),$(F),$$($(2)_DIR)/$(F),$(call UPPERCASE,$(5)))$$(sep))
>>  endif
>>  ifeq ($$($(2)_REDISTRIBUTE),YES)
>>  # Copy the source tarball (just hardlink if possible)
>
> Hold this one: it seems to break packages that define multiple license
> files, like libfuse. Looking into it...

This is a tricky problem, and I don't know how to solve it. The
foreach line does not work correctly with variables that are defined
inside an evaluated macro, as our inner-generic-package is.
Here is an example Makefile that shows the problem:

all:

VARA = foo bar

define inner
VARB = foo bar
VARC = $(1)
some-$(1):
        @echo $(1) != $(VARC)
        @echo $(1) = $$(VARC)
        @echo
        @echo $(foreach F,foo bar,echo $(F))
        @echo $(foreach F,$(VARA),echo $(F))
        @echo $(foreach F,$$(VARB),echo $(F))
        @echo $(foreach F,$$(VARC),echo $(F))
endef

outer = $(call inner,foo bar)
$(eval $(outer))


The first set of echoes shows that $(VARC) cannot be used like that,
it is empty. Using double-dollar signs does work.
However, when passing this to foreach you get problems. The first two
foreach'es show the expected output, while the second two show the
problem.

Here is the output:

$ make -f ~/tmp/wrap some-foo
foo bar !=
foo bar = foo bar

echo foo echo bar
echo foo echo bar
echo foo bar
echo foo bar

As you can see, the fact that we pass $$(VARC) to foreach renders the
foreach useless: it only iterates once instead of for each word. But
we cannot pass simply $(VARC) as that is empty when foreach is
evaluated.

Does anyone know how to solve this?

Thanks,
Thomas
