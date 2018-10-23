From: Ferdinand van Aartsen <ferdinand@ombud.nl>
Date: Tue, 23 Oct 2018 15:03:16 +0200
Subject: [Buildroot] [PATCH 1/1] cc-tool: use the same C++ standard as
 boost
In-Reply-To: <CANQCQpYPv8uJhVxPWXQ8rdjB_1R9FmKh8MHaDwZ7q1JmP41X-A@mail.gmail.com>
References: <20181022141818.335-1-ferdinand@ombud.nl>
 <CANQCQpYPv8uJhVxPWXQ8rdjB_1R9FmKh8MHaDwZ7q1JmP41X-A@mail.gmail.com>
Message-ID: <2a7201300934425b7dd62512108e5e15@ombud.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew Weber schreef op 2018-10-23 13:18:
> Ferdinand,
> 
> On Mon, Oct 22, 2018 at 9:18 AM Ferdinand van Aartsen
> <ferdinand@ombud.nl> wrote:
>> 
>> When boost context is enabled, we build boost with -std=c++11.
>> That causes cc-tool to fail, which was using the gcc default c++14.
>> 
>> Signed-off-by: Ferdinand van Aartsen <ferdinand@ombud.nl>
>> ---
>>  package/cc-tool/cc-tool.mk | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/package/cc-tool/cc-tool.mk b/package/cc-tool/cc-tool.mk
>> index e170e06a21..d5de920f6a 100644
>> --- a/package/cc-tool/cc-tool.mk
>> +++ b/package/cc-tool/cc-tool.mk
>> @@ -18,6 +18,11 @@ CC_TOOL_AUTORECONF = YES
>>  CC_TOOL_CONF_OPTS = --with-boost=$(STAGING_DIR)/usr
>>  CC_TOOL_CONF_ENV = LIBS="$(CC_TOOL_LIBS)"
>> 
>> +# With boost context selected, boost gets built with c++11
>> +ifeq 
>> ($(BR2_PACKAGE_BOOST_CONTEXT)$(BR2_TOOLCHAIN_GCC_AT_LEAST_4_7),yy)
>> +CC_TOOL_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
>> +endif
>> +
>>  # Help boost.m4 find the Boost Regex library, which needs the pthread
>>  # library, but isn't detected using a modern (pkg-config) mechanism.
>>  ifeq ($(BR2_STATIC_LIBS),y)
>> --
> 
> I believe this one is related to this patch, any impacts?
> http://patchwork.ozlabs.org/patch/983327/
> 

You're right, hadn't spotted that one, then that seems to be the correct 
solution.

Ferdinand
