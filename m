From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 4 Sep 2012 13:33:08 -0400
Subject: [Buildroot] [PATCH 2/2] Provide PAM default configuration files
 when building linux-pam package
In-Reply-To: <201209041902.30271.yann.morin.1998@free.fr>
References: <1346729322-17868-1-git-send-email-golubovsky@gmail.com>
 <1346729322-17868-2-git-send-email-golubovsky@gmail.com>
 <201209041902.30271.yann.morin.1998@free.fr>
Message-ID: <CADiAo4LQysVFknpskVM0Z2nfY_oSB8vUD306X1KYucM_My+kVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

Thanks for your comments. Replies below.

On Tue, Sep 4, 2012 at 1:02 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

>> ---
>>  package/linux-pam/default      |    8 ++++++++
>>  package/linux-pam/linux-pam.mk |    7 +++++++
>>  package/linux-pam/login        |    9 +++++++++
>
> I think that this patch, which adds the default files, should come
> _before_ the busybox patch. If only the busybox patch were to be
> applied, then PAM would not be useable as it would lack those files.
>
> In the current order, iIt would also break 'bisectability'.

This patch was a "reasonable compromise" to have a somewhat working
system emulating PAM-less behavior when PAM is enabled in login and no
proper PAM configs are provided.
I think that in a real project, a post-build filesystem fix should
replace these files with something more sensible (like mine does).
Regarding ordering, I'll try to switch the order.

>> +#
>> +# default; standard UN*X access
>> +#
>> +auth     required       pam_unix.so
>> +account  required       pam_unix.so
>> +password required       pam_unix.so
>> +session  required       pam_unix.so
>> +
>
> I am not a PAM expert, so I can't say whether these settings are correct,
> enough, or whatever. I'd trust close to anybody on this subject. ;-)

This is an example from PAM documentation: in all entries standard
Unix files (passwd/shadow) are checked, and null passwords are not
allowed.

>> +define LINUX_PAM_CONFFILES
>> +     $(INSTALL) -D -m 0644 package/linux-pam/default $(TARGET_DIR)/etc/pam.d/default
>> +     $(INSTALL) -D -m 0644 package/linux-pam/login $(TARGET_DIR)/etc/pam.d/login
>
> I'd use:
>     $(INSTALL) -D -m 0644 $(@D)/default $(TARGET_DIR)/etc/pam.d/default

But $(@D) is the build directory, while the files are part of
Buildroot package rather than PAM itself. $(@D) is to my understanding
output/build/linux-pam-x.y.z

>
> Also, shouldn't these files get special permission (ie. redable only by
> root, or stuff like that)? If so, then use:
>   LINUX_PAM_PERMISSIONS = .....

Not sure if that's needed: they do not have anything secret, just
nobody other than root can change them.

>> +# login: allow local logins to users with entries in /etc/passwd and
>> +# /etc/shadow even with null password
>> +#
>> +auth      required       pam_unix.so nullok
>> +account   required       pam_unix.so nullok
>> +password  required       pam_unix.so nullok
>> +session   required       pam_unix.so nullok
>
> Ditto, I'm not a PAM expert...

Neither am I... Just porting.

>
> Although I doubt I'd like a system where null passwords are OK... :-/

PAM-less mode allows this: the above config applies to local logins
only via busybox login.

> At the risk of adding to the option maze, I'd suggest at least adding
> a config knob to enable that. For example:
>
>   config BR2_PACKAGE_LINUX_PAM_NULL_PASSWD_OK
>       bool "Allow null passwords"
>       help
>         Allow local logins to users with entries in /etc/passwd
>         and /etc/shadow even with null password.
>
> And only add the "nullok" if that option is set.

I'm afraid this is too much. And it should be provided for the
PAM-less config as well.

One who wants to use PAM will likely design a proper authentication
scheme and provide their own better PAM configs.

>
> If that's not OK to add such an option, then I'd say we should remove the
> "nullok" stuff, and leave it to a local post-build script that tweaks this
> file if the user really wants to allow local null-password logins.
>
> IMNSHO, the defaut should be a secure system.

But it is not by default: root can login w/o password

http://git.buildroot.net/buildroot/tree/fs/skeleton/etc/shadow

this is /etc/shadow from buildroot git which is installed by default:
am I correct?

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
