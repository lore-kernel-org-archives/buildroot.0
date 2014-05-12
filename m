From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 12 May 2014 13:55:16 +0200
Subject: [Buildroot] [PATCH 2 of 7] infra: add comment describing
 single/double dollar-sign rules
In-Reply-To: <20140511204201.GF3428@free.fr>
References: <patchbomb.1399822724@argentina>
 <32d9759c21dfe0792ff0.1399822726@argentina>
 <20140511204201.GF3428@free.fr>
Message-ID: <CAAXf6LX-owX0xWtze_u8umgCe0u8qScHZcYfN_ob0T13QHS-nA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, May 11, 2014 at 10:42 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-05-11 17:38 +0200, Thomas De Schampheleire spake thusly:
>> As the rules with respect to variable and function references and the need
>> for single or double dollar signs are not trivial, add a comment in
>> pkg-generic.mk describing them.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>>
>> ---
>>  package/pkg-generic.mk |  13 +++++++++++++
>>  1 files changed, 13 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>> --- a/package/pkg-generic.mk
>> +++ b/package/pkg-generic.mk
>> @@ -250,6 +250,19 @@ endif
>>  #  argument 3 is the uppercase package name, without the HOST_ prefix
>>  #             for host packages
>>  #  argument 4 is the type (target or host)
>> +#
>> +# Note about variable and function references: inside all blocks that are
>> +# evaluated with $(eval), which includes all 'inner-xxx-package' blocks,
>
> Here I'd say something like:
>
>     ... evaluated with $(eval) [either directly or indirectly], ...
>
> We want these rules to apply even to functions called from inside an
> evaluated function, right?
>

No, I don't think this is true. The big problem is that most functions
can be called both within as outside of an evaluated block. When it is
not evaluated, then the double dollar signs cause incorrect behavior.

Take the following test program (which you can play with to test out
different combinations)

FOO = bar

func = something-$(FOO)-$(1)

define block
????????X = $(1)
????????Y = $$(FOO)

target:
????????@echo X=$$(X) Y=$$(Y) Z=$(call func,else)
endef


all:
????????@echo Z=$(call func,else)

$(eval $(call block,hello))


If you change 'func' to use $$(FOO) instead of $(FOO), then the 'all'
target will have output
/bin/sh: 1: FOO: not found
Z=something--else

instead of
Z=something-bar-else

Best regards,
Thomas
