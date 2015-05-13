From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 13 May 2015 08:22:31 +0200
Subject: [Buildroot] [RFC v3 30/30] pkg-generic: add support for
 per-package staging directory
In-Reply-To: <54F8F4BA.7020800@mind.be>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <1425374255-6827-31-git-send-email-fabio.porcedda@gmail.com>
 <54F8F4BA.7020800@mind.be>
Message-ID: <CAHkwnC_ASroFNeEwQ6Rrs7B=m93wpQuH5cefu9P8jyj07fBXoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 6, 2015 at 1:28 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 03/03/15 10:17, Fabio Porcedda wrote:
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>

<snip>

>> + $(2)_TARGET_LDFLAGS = $$(TARGET_LDFLAGS) -L$$($(2)_STAGING_DIR)/usr/lib -Wl,-rpath,$$($(2)_STAGING_DIR)/usr/lib
>> + $(2)_TARGET_CONFIGURE_OPTS = \
>> +     $$(TARGET_CONFIGURE_OPTS) \
>> +     PKG_CONFIG_SYSROOT_DIR="$$($(2)_STAGING_DIR)" \
>> +     PKG_CONFIG_PATH="$$($(2)_STAGING_DIR)/usr/lib/pkgconfig"
>> + $(2)_TARGET_MAKE_ENV = \
>> +     $$(TARGET_MAKE_ENV) \
>> +     PKG_CONFIG_SYSROOT_DIR="$$($(2)_STAGING_DIR)" \
>> +     PKG_CONFIG_PATH="$$($(2)_STAGING_DIR)/usr/lib/pkgconfig"
>> +else
>> + $(2)_STAGING_DIR = $$(STAGING_DIR)
>> + $(2)_TARGET_CONFIGURE_OPTS = $$(TARGET_CONFIGURE_OPTS)
>> + $(2)_TARGET_MAKE_ENV = $$(TARGET_MAKE_ENV)
>> +endif
>> +
>> +ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
>> + $(2)_STAGING_DIRS = $$(wildcard $$(foreach dep,\
>> +     $$(filter-out host-% toolchain,$$($(2)_FINAL_DEPENDENCIES)),\
>> +     $$($$(call UPPERCASE,$$(dep))_STAGING_DIR)))
>> +
>> + define $(2)_PREPARE_STAGING_DIR
>> +     mkdir -p $$(STAGING_DIR)/usr/include $$(STAGING_DIR)/usr/lib
>> +     $$(if $$($(2)_STAGING_DIRS),
>> +             cp -rdpf $$(addsuffix /*,$$($(2)_STAGING_DIRS)) \
>> +                     $$($(2)_STAGING_DIR))
>
>  Why not just
>                 cp -rdpf -t $$($(2)_STAGING_DIR) $$($(2)_STAGING_DIRS)
> ?

Because that command copy each source directory as a new sub directory
instead of copy the contents, e.g.:

directories:
dir_a/
  file_1
  file_2

dir_b/
  file_3

dest_dir/

command:
cp -rdpf -t dest_dir dir_a dir_b

result:
dest_dir/
  dir_a/
     file_1
     file_2
  dir_b/
     file_3

instead of:

cp -rdpf -t dest_dir dir_a/* dir_b/*

dest_dir/
  file_1
  file_2
  file_3

Thanks and BR
-- 
Fabio Porcedda
