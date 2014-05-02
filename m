From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri, 2 May 2014 14:49:19 +0200
Subject: [Buildroot] [PATCH v2 1/2] infra: Add generic check_prog_host
	function
In-Reply-To: <CAAXf6LVFWqNKarZbUKh_3VR9sfx4F0vN++4siGh0JQHrSgjQ0w@mail.gmail.com>
References: <1393172261-17421-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20140223184032.2c6d08de@skate>
 <CAGduivy7YPpfcvkOkZxH2_35BSxsjSK0_++RMaw3bxwJE2=QzA@mail.gmail.com>
 <CAGduivw6n_tGvg+HOjptV01CxgpviCgumoq_6szpNzre7d8R-g@mail.gmail.com>
 <CAAXf6LVFWqNKarZbUKh_3VR9sfx4F0vN++4siGh0JQHrSgjQ0w@mail.gmail.com>
Message-ID: <CAGduivwNEgnTAP4Bs_K1fnQ=gdxjp-NRhDOsnGoxu=g2EAPbPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

On Fri, May 2, 2014 at 2:20 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Maxime,
>
> On Fri, Mar 28, 2014 at 7:41 PM, Maxime Hadjinlian
> <maxime.hadjinlian@gmail.com> wrote:
>> Hi all,
>>
>> On Sun, Feb 23, 2014 at 7:12 PM, Maxime Hadjinlian
>> <maxime.hadjinlian@gmail.com> wrote:
>>> On Sun, Feb 23, 2014 at 6:40 PM, Thomas Petazzoni
>>> <thomas.petazzoni@free-electrons.com> wrote:
>>>> Dear Maxime Hadjinlian,
>>>>
>>>> On Sun, 23 Feb 2014 17:17:40 +0100, Maxime Hadjinlian wrote:
>>>>
>>>>> +# Verify that which is installed
>>>>> +check_prog_host "which"
>>>>
>>>> Since your function check_prog_host uses which to determine if the
>>>> program exists, isn't it weird to use which to verify it?
>>> Agreed but that was the original check also which I found a little in
>>> the first place. But since this patch is here only to introduce and
>>> use a function, I didn't see how to change that here.
>>>>
>>>> Your check_host_prog function could also be used in:
>>>>
>>>> # Check that a few mandatory programs are installed
>>>> missing_progs="no"
>>>> for prog in patch perl tar wget cpio python unzip rsync bc ${DL_TOOLS} ; do
>>>>         if ! which $prog > /dev/null ; then
>>>>                 echo "You must install '$prog' on your build machine";
>>>>                 missing_progs="yes"
>>>>                 if test $prog = "svn" ; then
>>>>                         echo "  svn is usually part of the subversion package in your distribution"
>>>>                 elif test $prog = "hg" ; then
>>>>                         echo "  hg is usually part of the mercurial package in your distribution"
>>>>                 elif test $prog = "zcat" ; then
>>>>                         echo "  zcat is usually part of the gzip package in your distribution"
>>>>                 elif test $prog = "bzcat" ; then
>>>>                         echo "  bzcat is usually part of the bzip2 package in your distribution"
>>>>                 fi
>>>>         fi
>>>> done
>>>>
>>>> if test "${missing_progs}" = "yes" ; then
>>>>         exit 1
>>>> fi
>>>>
>>>> Though you see that this loop has this missing_progs variable that
>>>> allows to list all the missing programs, and only abort at the end.
>>> I wanted to keep this one as is for the moment.
>>> As you point out, it uses the exact mechanisms we want for all the
>>> dependencies.sh, and it would be part of a follow up patch later one,
>>> which would uses the same mechanisms but all over the dependencies.sh.
>>> Which is want we want in the end.
>>> This first patch is mostly a follow up of the previous one, which
>>> added the BR2_NEEDS_HOST_JAVA
>>>>
>>>> Thomas
>>>> --
>>>> Thomas Petazzoni, CTO, Free Electrons
>>>> Embedded Linux, Kernel and Android engineering
>>>> http://free-electrons.com
>>
>> Just a bump.
>> Thomas, if I remember correctly, you were not opposed to this patch ?
>> As explained, it has been found that dependencies.sh needs a few other
>> rounds of patch so it would be better shaped, but that can be done
>> later.
>
> Is there a particular reason why the first part of the make check is
> not using check_prog_host ?
Not really no, but as was said, there's a lot to be done for this
script to be good, this patch doesn't aim to rework it fully. Simply
refactor some code that was redundant.
Other patch needs to be done.
>
> Another comment is that I find the split between this and the second
> patch (classpath) strange: I would move the addition of
> BR2_NEEDS_HOST_JAVAC / JAR to that second patch.
Agreed, but only for the HOST_JAVAC, because if I remember correctly,
classpath doesn't need JAR. But, you are absolutely right, it would
make more sense.

I'll try to cover that during the week end and resend. (famous last words...)
>
> Best regards,
> Thomas
