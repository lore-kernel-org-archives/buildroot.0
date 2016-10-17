From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 17 Oct 2016 23:08:00 +0200
Subject: [Buildroot] [PATCH v11 3/4] core: re-enter make if $(CURDIR) or
 $(O) are not canonical paths
In-Reply-To: <805b2212-70b5-06fe-3563-aa06395a1def@mind.be>
References: <20161016115423.17881-1-s.martin49@gmail.com>
 <20161016115423.17881-4-s.martin49@gmail.com>
 <805b2212-70b5-06fe-3563-aa06395a1def@mind.be>
Message-ID: <CAHXCMM+d4s8nkT5q+FANymRSmPkVOKD97nys8n4aAbFNxrnVnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Sun, Oct 16, 2016 at 5:59 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 16-10-16 13:54, Samuel Martin wrote:
>> When $(CURDIR) and/or $(O) contain symlinks in their paths, they can be
>> resolved differently, depending on each package build-system (whether it
>> uses the given paths or get the absolute canonical ones).
>>
>> Using absolute canonical paths will help achieving reproducible builds and
>> will make easier tracking down host machine paths leaking into the host,
>> target or staging trees.
>> So, this change ensure the build takes place with the CURDIR and O
>                         ^s
>
>> variables are set to their absolute canonical paths.
>>
>> In order to recall the toplevel makefile with absolute canonical paths
>> for $(CURDIR) and $(O), we need to:
>> 1- Compute the absolute canonical paths for $(CURDIR) and $(O) that will
>>    be passed to the sub-make. This is achieved using the 'realpath' make
>>    primitive. However, some care must be taken when manipulating O:
>>    - the out-of-tree makefile wrapper happens a trailing "/.", we need
>>      to strip this part away to not break the comparison driving the
>>      sub-make call;
>>    - the user can leave a trailing '/' to $(O);
>>    - according to [1,2], realpath returns an empty string in case of
>>      non-existing entry. So, to avoid passing an empty O= variable to
>>      sub-make, it is necessary to define the output directory and create
>>      it prior to call realpath on it (because on the first invocation,
>>      $(O) usually does not yet exists), hence the trick doing the mkdir
>>      right before calling realpath.
>> 2- Update EXTRAMAKEARGS with the absolute canonical $(O) and use it
>>    when call recalling the top-level makefile with umask and paths
>>    correctly set.
>> 3- Lastly, update the condition for setting the CONFIG_DIR and
>>    NEED_WRAPPER variables.
>
>  Actually for $(O) it is not strictly needed to re-enter make, but it just
> simplifies things, right?

I think so.

Regards,


-- 
Samuel
