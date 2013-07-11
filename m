From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 11 Jul 2013 13:24:24 +0200
Subject: [Buildroot] [PATCH] Makefile: unset MAKEFLAGS
In-Reply-To: <CAEYzJUFzijo=jM+s4P_ZFAH-E_-MvhKZbcjHmNUBypiu5pF6zQ@mail.gmail.com>
References: <1373222539-8915-1-git-send-email-s.martin49@gmail.com>
 <CAAXf6LVC=vqL0mCFVMpKs2A99QtBviHXsmXZp3B+fo+32-+dXA@mail.gmail.com>
 <CAEYzJUFzijo=jM+s4P_ZFAH-E_-MvhKZbcjHmNUBypiu5pF6zQ@mail.gmail.com>
Message-ID: <CAAXf6LUWBrWmXaBNjKkjXtGMt9kWLvuOBsj8c4nuc_DdqurbUQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bj?rn,

On Thu, Jul 11, 2013 at 12:33 PM, Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:
> On 11 July 2013 11:37, Thomas De Schampheleire
> <patrickdepinguin+buildroot@gmail.com> wrote:
>> Hi,
>>
>> On Sun, Jul 7, 2013 at 8:42 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>>> MAKEFLAGS can carry options that make Buildroot failed, eg. '-jN'.
>>> To avoid this, unset the MAKEFLAGS environment variable.
>>>
>>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>> ---
>>>  Makefile | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 015fbdf..11a7b70 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -207,6 +207,7 @@ unexport CFLAGS
>>>  unexport CXXFLAGS
>>>  unexport GREP_OPTIONS
>>>  unexport CONFIG_SITE
>>> +unexport MAKEFLAGS
>>>  unexport QMAKESPEC
>>>  unexport TERMINFO
>>>
>>
>> What is the strategy with respect to cleaning up the user's
>> environment when building buildroot?
>> Because there are a number of other variables that users can have (and
>> do have) that corrupt the build, for example:
>>
>> C_INCLUDE_PATH
>> CPLUS_INCLUDE_PATH
>> LIBRARY_PATH
>> LD_LIBRARY_PATH
>> PERL5LIB
>> GCC_EXEC_PREFIX
>>
>> In the twisted environments that I'm working in, I'm unsetting these
>> from a wrapper around buildroot make. However, it seems that there
>> already are a number of cleanups done inside buildroot itself, so it
>> makes sense to add the above variables to the list.
>>
>> What do you think?
>
> How about going all the way: clean out the environment completely, and
> explicitly add env vars to builders as needed. That would result in a
> more deterministic build environment, IMHO.

It's true that it would be deterministic, but I'm not sure if it's
always correct. There are some environment variables that could be
needed for a correct build, like proxy settings. Clearing them out
will be a problem in such cases.
So either we should work with a whitelist of safe flags, or keep the
existing environment but delete items on the blacklist.
