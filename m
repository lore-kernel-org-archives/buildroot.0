From: Hammami Omar <omar18hammami@gmail.com>
Date: Tue, 3 Mar 2020 13:33:58 +0100
Subject: [Buildroot] SSH server starts too late
In-Reply-To: <CAGSpp9ktPHnTeqQ2VkVW4D31QKMb68gBATkHo3PaW9NemeY8nQ@mail.gmail.com>
References: <CAGSpp9=qDFdtuETT8shQPXim25V7Yw2jvpjihbJgrttozOBVSQ@mail.gmail.com>
 <20200221111947.33e4677d@gmx.net>
 <CAGSpp9nYVE28LS2F5y97Xc0X_oXVJa8HDOiZKj73N7LOgMyGMA@mail.gmail.com>
 <r2p6br$27r7$1@ciao.gmane.io>
 <CAGSpp9ktPHnTeqQ2VkVW4D31QKMb68gBATkHo3PaW9NemeY8nQ@mail.gmail.com>
Message-ID: <CAGSpp9n8KTJvuAXWsVRUD09fovskkknHTBR57k87xo8LK2ZAhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

My problem is not resolved yet.
In fact, I have known that the libopenssl *1.1.1d* use getrandom function
in blocking mode.
So to disable this I have applied the modification below in
*crypto/rand/rand_unix.c* . But my problem is not resolved. In fact, my ssh
server starts too late (after ~2 minutes).

patch :
*# if defined(__linux) && defined(__NR_getrandom) *

* - return syscall(__NR_getrandom, buf, buflen, 0); *
*  +   return syscall(__NR_getrandom, buf, buflen, * *GRND_NONBLOCK* *);*

Did I miss something ?

In fact, I applied this modification because I saw that my ssh server
started only if the* nonblocking pool was initialized*.

Is it possible that  "*OPENSSL_RAND_SEED_GETRANDOM"* is not defined ?


*Note :*
I am using the openssh version* 8.1p1*

Kind regards,
Omar

Le ven. 21 f?vr. 2020 ? 19:30, Hammami Omar <omar18hammami@gmail.com> a
?crit :

> hello Grant,
>
> No, I have always the same "/var/ssh_host_rsa_key"
> The haveged script was started, I have very high value of entropy (2332)
> and the sshd process started too late.
>
>
> Le ven. 21 f?vr. 2020 ? 19:10, Grant Edwards <grant.b.edwards@gmail.com>
> a ?crit :
>
>> On 2020-02-21, Hammami Omar <omar18hammami@gmail.com> wrote:
>>
>> > By too late, I mean that my ssh server starts ~20 seconds later
>> comparing
>> > to the normal  (Old buildroot version in my case).
>>
>> Does it generate a new host key each time it starts?
>>
>> --
>> Grant Edwards               grant.b.edwards        Yow! Is a tattoo real,
>> like
>>                                   at               a curb or a battleship?
>>                               gmail.com            Or are we suffering in
>>                                                    Safeway?
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200303/67072457/attachment.html>
