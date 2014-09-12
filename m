From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 12 Sep 2014 09:58:38 -0400
Subject: [Buildroot] [PATCH 1/1] qt: make QtDeclarative depend on QtSql
In-Reply-To: <20140912093525.7df19a22@free-electrons.com>
References: <1410488495-2146-1-git-send-email-danomimanchego123@gmail.com>
 <20140912093525.7df19a22@free-electrons.com>
Message-ID: <CANxTyt7uCBPbyvtnBuaEtb2ewAqRPGD6psM9XjwO1u-DrTa0nQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, Sep 12, 2014 at 3:35 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Danomi Manchego,
>
> On Thu, 11 Sep 2014 22:21:35 -0400, Danomi Manchego wrote:
>> As indicated by QtDeclarative.pc, QtDeclarative needs QtSql.
>> It builds fine without it, but then you get a run-time error.
>> So add QtSql to the QtDeclarative depends-on list.
>>
>> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
>> ---
>>  package/qt/Config.in |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/qt/Config.in b/package/qt/Config.in
>> index da159b4..1f3e5fb 100644
>> --- a/package/qt/Config.in
>> +++ b/package/qt/Config.in
>> @@ -419,6 +419,7 @@ config BR2_PACKAGE_QT_DECLARATIVE
>>       bool "Declarative module"
>>       depends on BR2_PACKAGE_QT_SCRIPT
>>       depends on BR2_PACKAGE_QT_GUI_MODULE
>> +     depends on BR2_PACKAGE_QT_SQL_MODULE
>>       help
>>         Build the Qt Declarative Module for qml support
>>         if unsure, say n.
>
> Not really related to your patch, but why do we use "depends on"
> instead of "select" here? How am I supposed to know that I need to
> enable Sql stuff to be able to build the Declarative module?

I don't know why its that way (depends-on, no comment to indicated why
it's hidden).

Looking back at the history, most of the additions like this were
"depends on".  Most of the mods that added "select" were to select
non-Qt switches.  The commits logs that I scanned don't comment on one
versus the other, except for these two exceptions.

4059a814bb133d4dc306a366cdeba186cb7b8b89 - depends-on gstreamer used
due to complicated gstreamer dependencies.
d018125508c1d13f69b71702384c00c7095986a1 - qt-dbus: replace dependency
on dbus by select

For this particular case, I would have used a "select" if there were
not already pre-existing similar conditions.  (Similar in the sense
that they were also qt-config-related.)

The reason why I stumbled on to this is that I was attempting to
reduce my total ubifs file size be deselecting stuff.  Then my qml app
failed to load due to lack of QtSql.  So I figured that I'd patch, to
save my future self and others from the same fate.

Danomi -


> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
