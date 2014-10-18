From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 18 Oct 2014 21:06:16 +0200
Subject: [Buildroot] [PATCH buildroot-test 1/8] autobuild-run:
 check-requirements does not need to know the login details
In-Reply-To: <20141018173430.GD31723@free.fr>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
 <20141017222009.GQ3971@free.fr> <54426D4A.8050802@mind.be>
 <CAGduivxXvJcnD-x9MBfVApkL3V0yFwiM-Ei3oHqnPsGAoFq=mg@mail.gmail.com>
 <20141018173430.GD31723@free.fr>
Message-ID: <CAAXf6LXFyPhTgZ6z+U7CsVcnYS5LOpLd5iSNvah3NBhDC+ih3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[sorry, sent from non-subscribed account first, will bounce on the list]

All,

On Sat, Oct 18, 2014 at 7:34 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> All,
>
> On 2014-10-18 15:52 +0200, Maxime Hadjinlian spake thusly:
>> On Sat, Oct 18, 2014 at 3:38 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> > On 18/10/14 00:20, Yann E. MORIN wrote:
>> >> Thomas, All,
>> >>
>> >> On 2014-10-16 21:15 +0200, Thomas De Schampheleire spake thusly:
>> > [snip]
>> >>> @@ -553,8 +553,9 @@ if __name__ == '__main__':
>> >>>      check_version()
>> >>>      sysinfo = SystemInfo()
>> >>>      (ninstances, njobs, http_login, http_password, submitter) = config_get()
>> >>> -    check_requirements(http_login, http_password)
>> >>> -    if http_login is None or http_password is None:
>> >>> +    do_send_results = http_login and http_password
>> >>
>> >> I was told that we should no treat 'None' as 'False', or a non-empty
>> >> string as 'True'. This should be something like:
>> >>
>> >>     do_send_results = (not http_login is None) and (not http_password is None)
>> Just for the sake of it:
>> do_send_results = (http_login is not None) and (http_password is not None)
>
> Yup, I forgot that '... is not ...' is preferred over 'not ... is ...'
>


Extensive debate on just one line :)

First of all, the construct 'http_login and http_password' was already
in the original code, I just placed the result in a variable to allow
for reuse.

Secondly, regarding the quote Yann made of PEP8:


    Comparisons to singletons like None should always be done with is or
    is not, never the equality operators.

--> This is not relevant in this case, according to me, since we are
not using equality operators (==, !=).


    Also, beware of writing if x when you really mean if x is not None --
    e.g. when testing whether a variable or argument that defaults to None
    was set to some other value. The other value might have a type (such as
    a container) that could be false in a boolean context!


--> This part can be discussed. Arnout suggested that there may be a
hypothetical server that accepts empty http logins or password. Yes,
if you want to allow that, you cannot simply convert http_login in a
boolean as the empty string would render False, but it's not a case I
was coding for.

If I see code like:
    do_send_results = (http_login is not None) and (http_password is not None)
my first reaction would be to change it into
    do_send_results = http_login and http_password
although indeed it's not exactly the same. So a comment should be
written to make it explicit that the empty string is accepted as a
valid login/password.

All in all, I wonder if the empty string as login/password is a valid
use case to consider, and whether the uglier code is worth that.

But I'm not a difficult person, so if the consensus is to change that
line, no problem!

Best regards,
Thomas
