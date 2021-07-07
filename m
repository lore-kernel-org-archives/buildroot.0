From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 7 Jul 2021 16:05:31 +0200
Subject: [Buildroot] Buildroot way to populate additional partition
In-Reply-To: <30ad3d8a-cc28-4630-bdcd-2d246670e771@mind.be>
References: <CAOiXNkBX7rM5oLqEEjGJb7Z613=A3g7tK+jJNjOt3e3JosGBpQ@mail.gmail.com>
 <30ad3d8a-cc28-4630-bdcd-2d246670e771@mind.be>
Message-ID: <CAOiXNkCd2DhkFAqcuQrH_bWF5yaJoeEVmBnRp+DzjTH9pbrxew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildrooters,

Just for the case if someone else will be facing a similar problem, here is
how I solve it. The idea is to extend the post-image.sh and create an image
for user-data partition "manually" by invoking the genimage utility
directly with corresponding --rootpath, etc. parameters.

Here is the relevant part of the post-image.sh script.

main()
{
    echo "Initializing user data partition"
    local USER_DATA="$(mktemp -d)"
    local USER_DATA_TMP="$(mktemp -d)"

    # Create directories required for OverlayFS
    mkdir ${USER_DATA}/etc ${USER_DATA}/work_etc
    mkdir ${USER_DATA}/var ${USER_DATA}/work_var
    mkdir ${USER_DATA}/home ${USER_DATA}/work_home

    # this will create images/data.img
    # which will be used in complete image
    genimage \
        --rootpath "${USER_DATA}"     \
        --tmppath "${USER_DATA_TMP}"    \
        --outputpath "${BINARIES_DIR}" \
        --config board/phyboard-sargas-l-877e/gendataimg.cfg

    rm -rf ${USER_DATA} ${USER_DATA_TMP}

Thanks to Arnout and Maxim for suggestions which led me to this solution.

Regards,
Andrey.
