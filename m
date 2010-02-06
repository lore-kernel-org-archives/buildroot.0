From: microbit at virginbroadband.com.au <microbit@virginbroadband.com.au>
Date: Sat, 06 Feb 2010 13:51:57 +1100
Subject: [Buildroot] remove 'buildroot login' for cross compilation
 linux for an ARM
In-Reply-To: <4d28d4b51002050811v4d3075fei5c07761c45089760@mail.gmail.com>
References: <SNT129-W71192B9563D39A50DCE52B9540@phx.gbl>
	<4d28d4b51002050238m99ac60ay2d2a0b42b90c4ce@mail.gmail.com>
	<SNT129-W397AC20ABCC4B50BE11A7AB9540@phx.gbl>
	<4d28d4b51002050811v4d3075fei5c07761c45089760@mail.gmail.com>
Message-ID: <79b5a959881539e2aff29a6321a12a4f@virginbroadband.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Fri, 5 Feb 2010 17:11:42 +0100, Lionel Landwerlin
<llandwerlin@gmail.com> wrote:
> The /etc/inittab file defines the program to start at the end of the
boot
> process. Usually that's getty which asks for a login/password.
> This modification replace getty by /bin/sh. You can launch anything you
> want...
> 
> --
> Lionel
> 
> On Fri, Feb 5, 2010 at 5:01 PM, Tony Mozi <spooflinux@hotmail.fr> wrote:
> 
>>  Dear,
>> It's ok but I don't understand really this modification?
>> Can you explan me?
>> Is it possible to modify the '/  #' by another thing when the linux
>> start?
>> BR
>>
>> ------------------------------
>> Date: Fri, 5 Feb 2010 11:38:49 +0100
>> Subject: Re: [Buildroot] remove 'buildroot login' for cross compilation
>> linux for an ARM
>> From: llandwerlin at gmail.com
>> To: spooflinux at hotmail.fr
>> CC: buildroot at uclibc.org
>>
>>
>> Something like that :
>>
>> diff --git a/target/generic/Makefile.in b/target/generic/Makefile.in
>> index f77f969..44f78f2 100644
>> --- a/target/generic/Makefile.in
>> +++ b/target/generic/Makefile.in
>> @@ -21,7 +21,7 @@ target-generic-issue:
>>         echo "$(TARGET_GENERIC_ISSUE)" > $(TARGET_DIR)/etc/issue
>>
>>  target-generic-getty:
>> -       $(SED) '/#
>> GENERIC_SERIAL$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/sbin/getty -L
>> $(TARGET_GENERIC_GETTY) $(TARGET_GENERIC_GETTY_BAUDRATE) vt100 #~' \
>> +       $(SED) '/#
>> GENERIC_SERIAL$/s~^.*#~$(TARGET_GENERIC_GETTY)::respawn:/bin/sh #~' \
>>                 $(TARGET_DIR)/etc/inittab
>>
>>  ifneq ($(TARGET_GENERIC_HOSTNAME),)
>>
>>
>> On Fri, Feb 5, 2010 at 11:31 AM, Tony Mozi <spooflinux@hotmail.fr>
wrote:
>>
>>  Hi all,
>> I make the cross compilation of Linux-2.6.22.2 for an ARM9.
>> When I start my board, I have this message :
>>
>> *Welcome to
>> Buildroot
>> buildroot login:*
>>
>> Concerning the login, it's root, but it's possible to remove this step?
>> (to
>> start the board whitout login).
>>
>> BR
>>
>> ------------------------------
>> Vous cherchez l'int?grale des clips de Michael Jackson ? Bing ! Trouvez
>> !<http://www.bing.com/videos/search?q=Michael+Jackson&FORM=MVDE6>
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>>
>>
>> ------------------------------
>> Windows 7 : Trouvez le PC qui vous convient! D?couvrez notre offre !
>> <http://clk.atdmt.com/FRM/go/181574577/direct/01/>
>>

Ah, right. I thought the OP wanted to change the contents of the login
'welcome'.
Case of simple non-login should be as simple as providing -n switch to
getty (NO login).
AFAI remember you can directly be logged on without actual log in.

PS : if this works, remember you will always be UID 'root' when calling a
different log from 'getty'..

(I personally find it easier to use empty password, so you have a simple
log banner and press <CR>
at start)

HTH

B rgds
Kris
