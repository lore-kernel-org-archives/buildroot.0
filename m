From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 8 Feb 2018 14:56:44 -0500
Subject: [Buildroot] [PATCH 1/1] dbus: fix system_bus_socket location
In-Reply-To: <20180208193450.j4k5kj3ccdf5dk7o@tarshish>
References: <20180208192324.10325-1-aduskett@gmail.com>
 <20180208193450.j4k5kj3ccdf5dk7o@tarshish>
Message-ID: <CAFSsvmqDd_CrgW9VRUwfz34c28Qj5SkSWXs0pn2+bvki38cEOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch;

On Thu, Feb 8, 2018 at 2:34 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Adam,
>
> On Thu, Feb 08, 2018 at 02:23:24PM -0500, Adam Duskett wrote:
>> systemd237 changed the default location it uses for system_bus_socket
>> from /var/run/dbus/system_bus_socket to /run/dbus/system_bus_socket
>>
>> see:
>> https://github.com/systemd/systemd/commit/15ca0a42c7db49146a7169dbcb0683f0836cf8c2
>>
>> Change the default location for dbus from /var/run/dbus/system_bus_socket to
>> /run/dbus/system_bus_socket to fix the issue.
>>
>> Signed-off-by: Adam Duskett <aduskett@gmail.com>
>
> Jan Kundr?t suggested a different solution.
>
>   http://patchwork.ozlabs.org/patch/870834/
>
> baruch
>
That solution won't work on a rootfs with that is read/write.  My own filing
system doesn't have a symlink from /var/run to ./run

Perhaps it's just me?

>> ---
>>  package/dbus/dbus.mk | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
>> index 22ba22e17e..19f9b7ace8 100644
>> --- a/package/dbus/dbus.mk
>> +++ b/package/dbus/dbus.mk
>> @@ -27,7 +27,7 @@ DBUS_CONF_OPTS = \
>>       --disable-xml-docs \
>>       --disable-doxygen-docs \
>>       --with-xml=expat \
>> -     --with-system-socket=/var/run/dbus/system_bus_socket \
>> +     --with-system-socket=/run/dbus/system_bus_socket \
>>       --with-system-pid-file=/var/run/messagebus.pid
>>
>>  ifeq ($(BR2_STATIC_LIBS),y)
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
