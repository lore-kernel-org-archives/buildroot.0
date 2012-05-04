From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 4 May 2012 21:17:10 +0200
Subject: [Buildroot] [PATCH 1 of 2 v4-resend] Makefile.package.in: add
 utility functions find*clauses and notfirstword
In-Reply-To: <CAAXf6LUGcPJ7ReyOugz_ooxPw4ofUtqGR9oW3+q=tw-SwAmRzg@mail.gmail.com>
References: <patchbomb.1331743505@beantl019720>
 <c5374406a7e5dee296f0.1331743506@beantl019720>
 <CAAXf6LUGcPJ7ReyOugz_ooxPw4ofUtqGR9oW3+q=tw-SwAmRzg@mail.gmail.com>
Message-ID: <CAAXf6LU4n4HRVUN-13NoT8z7L2D5kVhae0xW8Yy3Hw5GmzN5Ow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 23, 2012 at 3:53 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> On Wed, Mar 14, 2012 at 5:45 PM, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
>> This patch adds a few utility functions to Makefile.package.in.
>>
>> Functions finddirclauses and findfileclauses help in building a find command
>> that skips a set of directories and performs operations on a set of files.
>> This pattern can for example be used to keep certain files or directories from
>> being stripped, or to remove certain files from a package installation.
>>
>> The notfirstword function is the inverse of the 'firstword' function in make:
>> it returns all but the first word.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>
>> ---
>> v4: simplify find*clauses even further. Thanks, Arnout!
>> v3: use -path instead of -wholename; fix a bug in finddirclauses. Thanks, Cam.
>> v2: integrate _cont variants in main find*clauses functions. Thanks, Arnout.
>>
>> ?package/Makefile.package.in | ?10 ++++++++++
>> ?1 files changed, 10 insertions(+), 0 deletions(-)
>>
>> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
>> --- a/package/Makefile.package.in
>> +++ b/package/Makefile.package.in
>> @@ -87,6 +87,16 @@ MESSAGE = echo "$(TERM_BOLD)>>> $($(PKG)
>> ?TERM_BOLD := $(shell tput smso)
>> ?TERM_RESET := $(shell tput rmso)
>>
>> +# Utility functions for 'find'
>> +# findfileclauses(filelist) => -name 'X' -o -name 'Y'
>> +findfileclauses = $(call notfirstword,$(patsubst %,-o -name '%',$(1)))
>> +# finddirclauses(base, dirlist) => -path 'base/dirX' -o -path 'base/dirY'
>> +finddirclauses = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
>> +
>> +# Miscellaneous utility functions
>> +# notfirstword(wordlist): returns all but the first word in wordlist
>> +notfirstword = $(wordlist 2,$(words $(1)),$(1))
>> +
>> ?# Download method commands
>> ?WGET:=$(call qstrip,$(BR2_WGET)) $(QUIET)
>> ?SVN:=$(call qstrip,$(BR2_SVN))
>
> bump

bump again
