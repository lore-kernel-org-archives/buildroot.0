From: Geoffrey Ragot <geoffreyragot@gmail.com>
Date: Sat, 26 Dec 2015 17:58:04 +0100
Subject: [Buildroot] Nginx package
In-Reply-To: <20151226154209.488813de@free-electrons.com>
References: <567E5D9E.1030003@gmail.com>
 <20151226105836.26a19543@free-electrons.com> <567E84A7.70302@gmail.com>
 <20151226154209.488813de@free-electrons.com>
Message-ID: <567EC71C.8070608@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Ok.
I will try the second way, it seems to be more straightforward if it works.

Thks for help.

Regards,
Geoffrey Ragot


On 12/26/2015 03:42 PM, Thomas Petazzoni wrote:
> Geoffrey,
>
> On Sat, 26 Dec 2015 13:14:31 +0100, Geoffrey Ragot wrote:
>
>> the pb is that luajit (in the context) is not a builtin module of nginx.
>> It has to be built in a directory and nginx has to be compiled with
>> "--add-module <path_to_luajit>".
>>
>> The nginx package has an option to specify "--add-module" arguments but
>> in this case, the dependency is not clearly mentionned in nginx.mk.
>> I have to care about build luajit before nginx to ensure that
>> <path_to_luajit> contains required files.
> I see two options here:
>
>   (1) If you really need to have the source of the Nginx Lua module
>       extracted before building nginx in order to use the --add-module
>       option, then you will have to create a package like nginx-lua,
>       that only downloads/extracts the module source code (and does not
>       build/install it). Then you change the nginx package to depend on
>       this nginx-lua package, and you pass --add-module=$(NGINX_LUA_DIR).
>
>   (2) If however, it is possible to build nginx-lua after nginx, then
>       you can do a better and more traditional packaging. Even though
>       they document --add-module as being the way of building nginx-lua,
>       all it seems to do during nginx configure is calling the "config"
>       script from nginx-lua, and then the "config.make" script. So I am
>       pretty sure it is possible to build nginx-lua after nginx.
>
> If it is possible, (2) would be preferred.
>
> Note that this is clearly not a trivial package to create.
>
> Best regards,
>
> Thomas
