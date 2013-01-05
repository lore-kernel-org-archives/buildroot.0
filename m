From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 5 Jan 2013 17:33:19 +0100
Subject: [Buildroot] [PATCH 2/3] rpi-userland: new package
In-Reply-To: <CAGduivw+nTUpN3yXws30bi+qssoemF3N7mo0=PL1UBhdOFCu7w@mail.gmail.com>
References: <cover.1357394983.git.maxime.hadjinlian@gmail.com>
 <0e55a309b9f4a9b8ee175d301d40e7574e9227b0.1357394983.git.maxime.hadjinlian@gmail.com>
 <CAHXCMMJi+pFKA8O9MvWMu83WR0dpqRFZ2RUxx6Hjs-hxyaskdA@mail.gmail.com>
 <CAGduivw+nTUpN3yXws30bi+qssoemF3N7mo0=PL1UBhdOFCu7w@mail.gmail.com>
Message-ID: <CAHXCMMK6M2tUiRWU9RvcyWbjcyCWCgwGvcEfbAw9J_aZXU+GmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

2013/1/5 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>:
> On Sat, Jan 5, 2013 at 4:18 PM, Samuel Martin <s.martin49@gmail.com> wrote:
>> Hi Maxime,
> Hi Samuel,
>>
>> 2013/1/5 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>:
[snip]
>>> +
>>> +define RPI_USERLAND_POST_TARGET_CLEANUP
>>> +    rm -Rf $(TARGET_DIR)/opt/vc/include
>>> +    rm -Rf $(TARGET_DIR)/opt/vc/share
>>> +    rm -Rf $(TARGET_DIR)/opt/vc/src
>>> +    rm -f  $(TARGET_DIR)/etc/init.d/vcfiled
>>> +    rm -f  $(TARGET_DIR)/opt/vc/lib/*.a
>>> +    rmdir -p --ignore-fail-on-non-empty $(TARGET_DIR)/etc/init.d || true
>> Since you use the --ignore-fail-on-non-empty option, i think "|| true"
>> is useless.
> You're totally right.
>>
>>> +    mv $(TARGET_DIR)/opt/vc/lib/* $(TARGET_DIR)/usr/lib/
>>> +    rm -Rf $(TARGET_DIR)/opt/vc/
>>> +endef
>>
>> Also, since you set RPI_USERLAND_INSTALL_STAGING = YES, don't you need
>> to do some cleanup/fixup hook for the staging area as well?
> Is it really useful to cleanup the staging area ?
Cleanup, not necessary...
But at least, fix the headers, libraries (static an dynamic) and
perhaps the data install locations if you keep /opt/vc as install
prefix, otherwise you will/may have some trouble to link against it...

>>
>>> +
>>> +RPI_USERLAND_POST_INSTALL_TARGET_HOOKS += RPI_USERLAND_POST_TARGET_CLEANUP
>>
>> BTW, it is possible to avoid this cleanup hook  (or at least reduce it
>> to the example source) with this patch:
>> http://code.bulix.org/3fo6ye-82780
>> and by adding "-DVMCS_INSTALL_PREFIX=/usr" to the
>> RPI_USERLAND_CONF_OPT variable.
> I think part of the cleanup is useful so we don't create a rootfs that
> comes with example sources code and useless files for runtime.
> In the other part, it's perfectly possible to add this option so it
> would install itself in the right place.
I agree.


Regards,

-- 
Samuel
