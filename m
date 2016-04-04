From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Apr 2016 22:45:45 +0200
Subject: [Buildroot] Project configuration management
In-Reply-To: <20160404204429.472fb279@free-electrons.com>
References: <24791852-D548-43A1-8E3D-C39D69F479BB@vestiacom.com>
 <20160404204429.472fb279@free-electrons.com>
Message-ID: <5702D279.3050904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/04/16 20:44, Thomas Petazzoni wrote:
> Hello Mateusz,
>
> On Mon, 4 Apr 2016 15:55:44 +0200, Mateusz S?upny wrote:
>
>> We are using buildroot for building a series of projects. What I feel
>> is missing in buildroot is a way to store different configurations in
>> scope of a single project. For example, we would like to prepare
>> three types of builds, let's name them "Release", that is the basic
>> build, "Develop", that is a Release build + dropbear + some other
>> utilities, and "Extra", that contains all configuration options from
>> Develop + some additional tools (gdb, valgrind, etc.). To achieve
>> that, we have to maintain total of (number of projects) x (number of
>> build types) different configuration files that are almost identical.
>>
>> Can this goal be achieved without using multiple defconfig files that
>> share approx 90% of their contents? What would you advise to avoid
>> that?
>>
>> First solution that comes to my mind is to allow nesting defconfig
>> files with some include/source statement, but AFAICS that's not
>> supported.
>>
>> Please note that we are aware of "layered customizations" concept,
>> and we're using it to some degree, but it doesn't solve all the
>> issues, e.g. setting toolchain, selecting packages, and setting
>> multiple paths to layers itself has to be done in defconfig files
>> anyway.
>
> The mechanism we typically advise in such situation is to use defconfig
> fragments, and assemble them as needed to create the configuration you
> feed into Buildroot. A shell script (or other) can help generating the
> configuration fed into Buildroot from the fragments.

  And that shell script exists already: support/kconfig/merge_config.sh

  The main difficulty with this model is that there is no simple way to split 
configs. Fortunately, for buildroot this is typically not much of a problem, 
because your fragments will just add some packages.


  Regards,
  Arnout


>
> I'm Cc'ing Gustavo, who has been using this model for quite some time
> for a large project that involves multiple HW platforms, I'm sure he
> can give more insights on how to achieve that.
>
> Best regards,
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
